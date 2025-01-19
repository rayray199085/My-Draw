import 'dart:ui';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/theme/gaps.dart';
import '../draw_screen_constants.dart';

class DrawBoardHelper {
  /// AnimatedBallNumberView is shown at the center of the board
  static Offset calculateAnimatedBallNumberViewStartPosition(
      {required double maxWidth, required double gridViewHeight}) {
    final x = (maxWidth - DrawScreenConstants.animatedBallNumberWidth) / 2.0;
    final y =
        (gridViewHeight - DrawScreenConstants.animatedBallNumberHeight) / 2.0;
    return Offset(x, y);
  }

  /// Calculate the target position animated AnimatedBallNumberView moves to
  static Offset calculateAnimatedBallNumberViewEndPosition({
    required int number,
    required double gridSectionHeight,
    required double cellWidth,
    required double cellHeight,
  }) {
    final sectionCellCount = AppConstants.totalTicketNumber ~/
        2; // each section has half ticket numbers
    final sectionRowCount =
        sectionCellCount ~/ DrawScreenConstants.boardCrossAxisCount;
    final isInTails = number > sectionCellCount;

    double x = DrawScreenConstants.drawBoardLabelWidth +
        Gaps.spacing4; // initial left position
    double y = isInTails
        ? (gridSectionHeight + DrawScreenConstants.boardSectionVerticalGap)
        : 0.0; // initial top position

    int row = ((number - 1) / DrawScreenConstants.boardCrossAxisCount).floor();
    row -= isInTails ? sectionRowCount : 0;
    y += row * (cellHeight + DrawScreenConstants.boardMainAxisSpacing);

    int col = (number - 1) % DrawScreenConstants.boardCrossAxisCount;
    x += col * (cellWidth + DrawScreenConstants.boardCrossAxisSpacing);
    return Offset(x, y);
  }

  /// Calculate DrawBoardSection height
  static double calculateBoardSectionHeight({
    required double maxWidth,
    required int itemsCount,
  }) {
    final double cellWidth = calculateBoardSectionCellWidth(maxWidth: maxWidth);
    final cellHeight =
        cellWidth / DrawScreenConstants.drawBoardGridCellAspectRatio;
    final rowCount = itemsCount / DrawScreenConstants.boardCrossAxisCount;
    final gridSectionHeight = cellHeight * rowCount +
        (rowCount - 1) * DrawScreenConstants.boardMainAxisSpacing;
    return gridSectionHeight;
  }

  /// Calculate DrawBoardSectionCell width
  static double calculateBoardSectionCellWidth({required double maxWidth}) {
    final double sectionWidth = maxWidth -
        DrawScreenConstants
            .drawBoardLabelWidth; // including the left margin to section label
    final double cellWidth = (sectionWidth -
            DrawScreenConstants.boardCrossAxisCount *
                DrawScreenConstants.boardCrossAxisSpacing) /
        DrawScreenConstants.boardCrossAxisCount;
    return cellWidth;
  }
}
