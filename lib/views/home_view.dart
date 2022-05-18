import 'package:flutter/material.dart';
import 'package:priorities/utils/constants.dart';
import 'package:priorities/views/components/priorities_grid.dart';
import 'package:priorities/views/components/home_view_title.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kMidPadding,
        vertical: kMidPadding * 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeViewTitle(),
          const SizedBox(height: kMidPadding),
          //TODO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Recent',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: kAppColor,
                ),
              ),
              Icon(Icons.menu_rounded),
            ],
          ),
          const PrioritiesGrid(),
        ],
      ),
    );
  }
}
