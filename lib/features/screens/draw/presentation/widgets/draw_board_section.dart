import 'package:flutter/material.dart';
import 'package:my_draw/core/theme/radius_values.dart';
import 'package:my_draw/features/screens/draw/presentation/widgets/draw_board_section_label.dart';

import '../../../../../core/theme/gaps.dart';
import '../../../../../generated/l10n.dart';
import '../draw_screen_constants.dart';

class _DrawBoardSectionConstants {
  static const double drawBoardLabelWidth = 24.0;
  static const double gridCellAspectRatio = 3 / 2;
}

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
  });

  final int startingIndex;
  final int itemsCount;
  final DrawBordSectionType sectionType;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: [
            SizedBox(
                height:
                    _calculateGridViewHeight(maxWidth: constraints.maxWidth),
                width: _DrawBoardSectionConstants.drawBoardLabelWidth,
                child: DrawBoardSectionLabel(
                  text: _sectionLabel,
                  backgroundColor: _getSectionLabelColor(context),
                )),
            const SizedBox(width: Gaps.spacing4),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: DrawScreenConstants.boardCrossAxisCount,
                  crossAxisSpacing: Gaps.spacing4,
                  mainAxisSpacing: Gaps.spacing4,
                  childAspectRatio:
                      _DrawBoardSectionConstants.gridCellAspectRatio,
                ),
                itemCount: itemsCount,
                itemBuilder: (context, index) {
                  final number =
                      startingIndex + index + 1; // number = index + 1
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius:
                            BorderRadius.circular(RadiusValues.circular4)),
                    alignment: Alignment.center,
                    child: Text(
                      number.toString(),
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  double _calculateGridViewHeight({required double maxWidth}) {
    final double gridWidth =
        maxWidth - _DrawBoardSectionConstants.drawBoardLabelWidth;
    final double cellWidth =
        (gridWidth - DrawScreenConstants.boardCrossAxisCount * Gaps.spacing4) /
            DrawScreenConstants.boardCrossAxisCount;
    final cellHeight =
        cellWidth / _DrawBoardSectionConstants.gridCellAspectRatio;
    final rowCount = itemsCount / DrawScreenConstants.boardCrossAxisCount;
    final gridViewHeight =
        cellHeight * rowCount + (rowCount - 1) * Gaps.spacing4;
    return gridViewHeight;
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
