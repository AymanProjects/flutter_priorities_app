import 'package:flutter/material.dart';
import 'package:priorities/utils/constants.dart';
import 'package:priorities/views/home/components/priority_block/priority_block.dart';
import 'package:priorities/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class PrioritiesGrid extends ViewModelWidget<HomeViewModel> {
  final double blocksAspectRatio;

  const PrioritiesGrid({
    Key? key,
    required this.blocksAspectRatio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Expanded(
      child: ShaderMask(
        blendMode: BlendMode.dstOut,
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.01, 0.99, 1],
            colors: <Color>[
              Colors.white,
              Colors.transparent,
              Colors.transparent,
              Colors.white,
            ],
          ).createShader(bounds);
        },
        child: GridView.count(
          childAspectRatio: blocksAspectRatio,
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: kLgPadding,
          crossAxisSpacing: kLgPadding,
          padding: const EdgeInsets.symmetric(vertical: kSmPadding),
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          children: viewModel.priorities
              .map((priority) => PriorityBlock(priority))
              .toList(),
        ),
      ),
    );
  }
}
