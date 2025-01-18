import 'package:flutter/material.dart';
import 'package:my_draw/core/theme/gaps.dart';
import 'package:my_draw/core/theme/radius_values.dart';

class DrawBoardSectionLabel extends StatelessWidget {
  const DrawBoardSectionLabel({
    super.key,
    required this.text,
    this.backgroundColor,
  });
  final String text;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiusValues.circular4),
        color: backgroundColor ?? Theme.of(context).colorScheme.primary,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Gaps.spacing4,
        vertical: Gaps.spacing2,
      ),
      alignment: Alignment.center,
      child: RotatedBox(
        quarterTurns: -1, // rotate -90 degree
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
