import 'package:priorities/data/repositories/priorities_repo.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:priorities/data/constants/ui_constants.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:priorities/services/notifications_service.dart';
import 'package:priorities/services/navigation_service.dart';
import 'package:priorities/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'dart:math';

//  Logic code only

class PriorityViewModel extends BaseViewModel {
  Priority? priority;
  late String selectedEmoji;
  late int selectedColor;
  late List<int> categoryIDs;
  late List<int> taskIDs;

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final textKeyboardNode = FocusNode();

  bool isEmojiKeyboardShowing = false;

  PriorityViewModel(this.priority);

  void init() {
    selectedColor = priority?.colorId ?? Random().nextInt(kCardColors.length);
    titleController.text = priority?.title ?? '';
    selectedEmoji = '📔';
    categoryIDs = priority?.categoryIDs ?? <int>[];
    taskIDs = priority?.taskIDs ?? <int>[];

    textKeyboardNode.addListener(() {
      if (textKeyboardNode.hasFocus) {
        closeEmojiKeyboard();
      }
    });
  }

  bool get isEditingMode => priority != null;

  void onCreateOrConfirmButtonPressed() async {
    if (formKey.currentState?.validate() ?? false) {
      runBusyFuture(_createOrUpdatePriority())
          .then(
            (value) => locator<NavigationService>().closeCurrentPage(value),
          )
          .catchError(
            (error) =>
                locator<NotificationsService>().showError(error.toString()),
          );
    }
  }

  Future<Priority> _createOrUpdatePriority() {
    final updatedPriority = Priority(
      id: priority?.id,
      colorId: selectedColor,
      categoryIDs: categoryIDs,
      taskIDs: taskIDs,
      emoji: selectedEmoji,
      title: titleController.text,
    );
    return locator<PrioritiesRepository>().updateOrCreate(updatedPriority);
  }

  void setSelectedColor(int index) {
    selectedColor = index;
    notifyListeners();
  }

  String? titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Title must be provided';
    }
    return null;
  }

  void onEmojiIconPressed() async {
    if (textKeyboardNode.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
      await Future.delayed(const Duration(milliseconds: 250));
    }
    isEmojiKeyboardShowing = true;
    notifyListeners();
  }

  void onEmojiSelected(_, Emoji emoji) {
    selectedEmoji = emoji.emoji;
    closeEmojiKeyboard();
  }

  void closeEmojiKeyboard() {
    isEmojiKeyboardShowing = false;
    notifyListeners();
  }
}
