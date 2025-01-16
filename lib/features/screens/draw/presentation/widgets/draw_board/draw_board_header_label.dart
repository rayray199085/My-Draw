import 'package:flutter/material.dart';
import 'package:my_draw/core/theme/gaps.dart';
import 'package:my_draw/core/theme/radius_values.dart';
import 'package:my_draw/features/screens/draw/presentation/enums/draw_board_section_type.dart';
import 'package:my_draw/features/screens/draw/presentation/utils/draw_board_section_color.dart';

class DrawBoardHeaderLabel extends StatelessWidget {
  const DrawBoardHeaderLabel({
    super.key,
    required this.type,
    required this.count,
    required this.width,
  });
  final DrawBoardSectionType type;
  final int count;
  final double width;

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        getDrawBoardSectionPrimaryColor(context: context, type: type);
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: Gaps.spacing2,
      children: [
        Text(
          type.label,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiusValues.circular4),
            color: primaryColor,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: Gaps.spacing4,
            vertical: Gaps.spacing2,
          ),
          alignment: Alignment.center,
          width: width,
          child: Text(
            count.toString(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
