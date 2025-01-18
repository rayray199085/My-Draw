import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../draw_screen_constants.dart';
import '../../enums/draw_board_section_type.dart';
import '../../utils/draw_board_helper.dart';
import '../animated_ball_number_view.dart';
import 'draw_board_section.dart';

class DrawBoardContent extends StatefulWidget {
  const DrawBoardContent({
    super.key,
    required this.gridSectionHeight,
    required this.width,
    required this.number,
  });

  final double gridSectionHeight;
  final double width;
  final int? number;

  @override
  State<DrawBoardContent> createState() => _DrawBoardContentState();
}

class _DrawBoardContentState extends State<DrawBoardContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _positionAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(
          seconds: DrawScreenConstants.positionAnimationDurationInSeconds),
      vsync: this,
    );

    _configureAnimations();
    _animationController.forward();
  }

  void _configureAnimations() {
    final startingPoint = DrawBoardHelper.getAnimationStartingPosition(
        maxWidth: widget.width, gridViewHeight: _gridViewHeight);
    final double cellWidth =
        DrawBoardHelper.getGridCellWidth(maxWidth: widget.width);
    final cellHeight =
        cellWidth / DrawScreenConstants.drawBoardGridCellAspectRatio;
    final targetPoint = widget.number != null
        ? DrawBoardHelper.getAnimationTargetPosition(
            number: widget.number!,
            gridSectionHeight: widget.gridSectionHeight,
            cellWidth: cellWidth,
            cellHeight: cellHeight,
          )
        : startingPoint;
    _positionAnimation = Tween<Offset>(
      begin: startingPoint, // Starting position
      end: targetPoint, // Ending position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose(); // Clean up the controller when done
    super.dispose();
  }

  void _startAnimation() {
    _animationController.reset();
    _configureAnimations();
    _animationController.forward();
  }

  double get _gridViewHeight =>
      widget.gridSectionHeight * 2 +
      DrawScreenConstants.boardSectionVerticalGap;

  @override
  void didUpdateWidget(covariant DrawBoardContent oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.number != widget.number && widget.number != null) {
      _startAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    final sectionItemCount = AppConstants.totalTicketNumber ~/
        2; // each section has half of the total numbers
    return SizedBox(
      height: _gridViewHeight,
      child: Stack(
        children: [
          Column(
            spacing: DrawScreenConstants.boardSectionVerticalGap,
            children: [
              DrawBoardSection(
                startingIndex: 0,
                itemsCount: sectionItemCount,
                sectionType: DrawBoardSectionType.heads,
                height: widget.gridSectionHeight,
              ),
              DrawBoardSection(
                startingIndex: sectionItemCount,
                itemsCount: sectionItemCount,
                sectionType: DrawBoardSectionType.tails,
                height: widget.gridSectionHeight,
              )
            ],
          ),
          if (widget.number != null)
            AnimatedBuilder(
              animation: _positionAnimation,
              builder: (context, child) {
                return Positioned(
                    left: _positionAnimation.value.dx, // X position
                    top: _positionAnimation.value.dy,
                    child: child!);
              },
              child: AnimatedBallNumberView(number: widget.number!),
            )
        ],
      ),
    );
  }
}
