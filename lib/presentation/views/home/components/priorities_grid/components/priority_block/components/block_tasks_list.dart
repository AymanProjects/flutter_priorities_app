import 'package:priorities/data/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:priorities/data/models/task.dart';
import 'package:priorities/presentation/__components/centered_loading_indicator.dart';

class BlockTasksList extends StatelessWidget {
  final List<Task>? tasks;

  const BlockTasksList(
    this.tasks, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tasks == null
        ? const CenteredLoadingIndicator.small()
        : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tasks!.length,
            itemBuilder: (context, index) {
              final task = tasks![index];
              return Padding(
                padding: const EdgeInsets.only(
                  left: kSmPadding,
                  top: kSmPadding,
                ),
                child: Text(
                  '- ${task.title}',
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),
              );
            },
          );
  }
}
