import 'package:flutter/material.dart';
import 'package:my_draw/core/theme/gaps.dart';
import 'package:my_draw/core/theme/radius_values.dart';

const double _iconSize = 14.0;

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(RadiusValues.circular20);
    return InkWell(
      borderRadius: borderRadius,
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: borderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Gaps.spacing8, vertical: Gaps.spacing4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: Gaps.spacing2,
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.onSecondary,
                size: _iconSize,
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
