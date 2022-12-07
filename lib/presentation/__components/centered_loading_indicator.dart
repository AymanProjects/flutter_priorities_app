import 'package:flutter/material.dart';
import 'package:priorities/data/constants/theme.dart';

class CenteredLoadingIndicator extends StatelessWidget {
  final bool isFainted;
  final bool isSmall;
  const CenteredLoadingIndicator(
      {super.key, this.isFainted = false, this.isSmall = false});

  const CenteredLoadingIndicator.small(
      {super.key, this.isFainted = true, this.isSmall = true});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: isSmall ? 18.0 : 28.0,
        width: isSmall ? 18.0 : 28.0,
        child: CircularProgressIndicator(
          strokeWidth: isSmall ? 2.0 : 3.0,
          valueColor: AlwaysStoppedAnimation(
            isFainted ? kAppColor.withOpacity(0.6) : null,
          ),
        ),
      ),
    );
  }
}
