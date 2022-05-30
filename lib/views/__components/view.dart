import 'package:flutter/material.dart';
import 'package:priorities/utils/constants.dart';
import 'package:priorities/views/__components/pop_button.dart';

/// Standard view to be used by every screen in this app.
/// It gives the screens standard configurations like padding.

/// TODO add to horizon kit
class View extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool hasBackButton;
  final Widget? trailing;

  const View({
    Key? key,
    required this.title,
    required this.children,
    this.hasBackButton = true,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: kLgPadding,
            right: kLgPadding,
            top: kLgPadding * 1.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  hasBackButton ? const PopButton() : const SizedBox(),
                  const Spacer(),
                  trailing ?? const SizedBox(),
                ],
              ),
              const SizedBox(height: kLgPadding),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: kLgPadding),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
