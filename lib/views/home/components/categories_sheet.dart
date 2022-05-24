import 'package:flutter/material.dart';
import 'package:priorities/utils/constants.dart';
import 'package:priorities/views/components/horizon_button.dart';
import 'package:priorities/views/components/horizon_icon_button.dart';

class CategoriesSheet extends StatelessWidget {
  const CategoriesSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kLgPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HorizonIconButton(
                onTap: Navigator.of(context).pop,
                icon: Icons.keyboard_arrow_down_rounded,
                iconSize: 32.0,
              ),
              const Text('Categories'),
              HorizonIconButton(
                onTap: Navigator.of(context).pop,
                icon: Icons.add_rounded,
                iconSize: 26.0,
              ),
            ],
          ),
          const SizedBox(height: kMdPadding),
          HorizonButton(
            onTap: () {},
            text: 'Option 1',
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
