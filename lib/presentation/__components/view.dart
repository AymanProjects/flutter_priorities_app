import 'package:priorities/presentation/__components/close_page_button.dart';
import 'package:flutter/material.dart';

/// Standard view to be used by every screen in this app.
/// It gives the screens standard configurations like padding.

class View extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool hasBackButton;
  final Widget? trailing;

  const View({
    required this.title,
    required this.children,
    this.hasBackButton = true,
    this.trailing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 27.0,
            left: 18.0,
            right: 18.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 22.0,
                child: Row(
                  children: [
                    hasBackButton ? const ClosePageButton() : const SizedBox(),
                    const Spacer(),
                    trailing ?? const SizedBox(),
                  ],
                ),
              ),
              const SizedBox(height: 18.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 18.0),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
