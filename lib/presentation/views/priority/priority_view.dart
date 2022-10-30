import 'package:flutter/material.dart';
import 'package:priorities/data/models/priority.dart';
import 'package:priorities/presentation/__components/horizon_button.dart';
import 'package:priorities/presentation/__components/view.dart';
import 'package:priorities/presentation/views/priority/priority_view_model.dart';
import 'package:stacked/stacked.dart';

//  UI code only

class PriorityView extends StatelessWidget {
  final Priority? priority;

  /// if a priority is passed, then the view will be for editing not creating
  const PriorityView({
    Key? key,
    this.priority,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PriorityViewModel>.reactive(
      viewModelBuilder: () => PriorityViewModel(priority),
      builder: (context, viewModel, child) {
        return View(
          title: viewModel.title,
          children: [
            HorizonButton(
              text: viewModel.buttonText,
              isLoading: viewModel.isBusy,
              onPressed: viewModel.createOrUpdatePriority,
            ),
          ],
        );
      },
    );
  }
}
