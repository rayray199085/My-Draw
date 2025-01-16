import 'package:flutter/material.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board/draw_board_section_label.dart';

import '../../../../../../core/theme/gaps.dart';
import '../../../../../../generated/l10n.dart';
import '../../draw_screen_constants.dart';
import 'draw_board_section_cell.dart';

enum DrawBordSectionType {
  heads,
  tails,
}

extension DrawBordSectionTypeExtension on DrawBordSectionType {
  String get label {
    switch (this) {
      case DrawBordSectionType.heads:
        return S.current.heads;
      case DrawBordSectionType.tails:
        return S.current.tails;
    }
  }
}

class DrawBoardSection extends StatelessWidget {
  const DrawBoardSection({
    super.key,
    this.startingIndex = 0,
    required this.itemsCount,
    required this.sectionType,
    required this.height,
  });

  final int startingIndex;
  final int itemsCount;
  final DrawBordSectionType sectionType;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: height,
            width: DrawScreenConstants.drawBoardLabelWidth,
            child: DrawBoardSectionLabel(
              text: _sectionLabel,
              backgroundColor: _getSectionLabelColor(context),
            )),
        const SizedBox(width: Gaps.spacing4),
        Expanded(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: DrawScreenConstants.boardCrossAxisCount,
              crossAxisSpacing: Gaps.spacing4,
              mainAxisSpacing: Gaps.spacing4,
              childAspectRatio:
                  DrawScreenConstants.drawBoardGridCellAspectRatio,
            ),
            itemCount: itemsCount,
            itemBuilder: (context, index) {
              final number = startingIndex + index + 1; // number = index + 1
              return DrawBoardSectionCell(number: number);
            },
          ),
        ),
      ],
    );
  }

  String get _sectionLabel {
    switch (sectionType) {
      case DrawBordSectionType.heads:
        return S.current.heads;
      case DrawBordSectionType.tails:
        return S.current.tails;
    }
  }

  Color _getSectionLabelColor(BuildContext context) {
    switch (sectionType) {
      case DrawBordSectionType.heads:
        return Theme.of(context).colorScheme.tertiary;
      case DrawBordSectionType.tails:
        return Theme.of(context).colorScheme.primary;
    }
  }
}
