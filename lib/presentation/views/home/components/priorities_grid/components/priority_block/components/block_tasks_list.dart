import 'package:priorities/data/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:priorities/data/models/task.dart';

class BlockTasksList extends StatelessWidget {
  final List<Task>? tasks;

  const BlockTasksList(
    this.tasks, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return tasks == null
        ? const Center(child: CircularProgressIndicator())
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
                  '- ${task.content}',
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            },
          );
  }
}
