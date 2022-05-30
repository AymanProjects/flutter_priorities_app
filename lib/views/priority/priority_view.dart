import 'package:flutter/material.dart';
import 'package:priorities/domain/entities/priority.dart';
import 'package:priorities/views/priority/priority_view_model.dart';
import 'package:stacked/stacked.dart';

//  UI code only

class PriorityView extends StatelessWidget {
  final Priority? priority;

  /// if the priority is null, then will use this view to create a new one
  const PriorityView({
    Key? key,
    this.priority,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PriorityViewModel>.reactive(
      viewModelBuilder: () => PriorityViewModel(),
      builder: (context, viewModel, child) {
        return Container();
      },
    );
  }
}
