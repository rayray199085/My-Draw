import 'package:flutter/material.dart';
import 'package:my_draw/core/constants/app_constants.dart';
import 'package:my_draw/features/screens/draw/presentation/utils/draw_board_section_color.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_section_label.dart';

import '../../../../../../core/theme/gaps.dart';
import '../../draw_screen_constants.dart';
import '../../enums/draw_board_section_type.dart';
import 'draw_board_section_cell.dart';

class DrawBoardSection extends StatelessWidget {
  const DrawBoardSection({
    super.key,
    required this.sectionType,
    required this.height,
    required this.ballNumbers,
  });

  final DrawBoardSectionType sectionType;
  final double height;
  final List<int> ballNumbers;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: height,
            width: DrawScreenConstants.drawBoardLabelWidth,
            child: DrawBoardSectionLabel(
              text: sectionType.label,
              backgroundColor: getDrawBoardSectionPrimaryColor(
                  context: context, type: sectionType),
            )),
        const SizedBox(width: Gaps.spacing4),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: DrawScreenConstants.boardCrossAxisCount,
              crossAxisSpacing: DrawScreenConstants.boardCrossAxisSpacing,
              mainAxisSpacing: DrawScreenConstants.boardMainAxisSpacing,
              childAspectRatio:
                  DrawScreenConstants.drawBoardGridCellAspectRatio,
            ),
            itemCount: AppConstants.totalTicketNumber ~/ 2,
            itemBuilder: (context, sectionIndex) {
              final cellNumber = sectionType.startIndex +
                  sectionIndex +
                  1; // top section: start index is 0; bottom section: start index is 40
              return DrawBoardSectionCell(
                number: cellNumber,
                isSelected: ballNumbers.contains(cellNumber),
              );
            },
          ),
        ),
      ],
    );
  }
}
