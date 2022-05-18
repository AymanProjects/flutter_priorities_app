import 'package:flutter/material.dart';
import 'package:priorities/utils/constants.dart';
import 'package:priorities/views/components/priority_block.dart';

class PrioritiesGrid extends StatelessWidget {
  const PrioritiesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: kMidPadding,
      crossAxisSpacing: kMidPadding,
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.symmetric(vertical: kMidPadding),
      physics: const BouncingScrollPhysics(),
      children: const [
        PriorityBlock(color: Colors.red),
        PriorityBlock(color: Colors.blue),
        PriorityBlock(color: Colors.orange),
        PriorityBlock(color: Colors.green),
      ],
    );
  }
}
