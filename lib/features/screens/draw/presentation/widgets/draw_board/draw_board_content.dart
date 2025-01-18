import 'package:flutter/material.dart';

import '../../draw_screen_constants.dart';
import '../../enums/draw_board_section_type.dart';
import '../../utils/draw_board_helper.dart';
import 'animated_ball_number_view.dart';
import 'draw_board_section.dart';

class DrawBoardContent extends StatefulWidget {
  const DrawBoardContent({
    super.key,
    required this.boardSectionHeight,
    required this.width,
    required this.ballNumbers,
  });

  final double boardSectionHeight;
  final double width;
  final List<int> ballNumbers;

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

  int? get _currentBallNumber => widget.ballNumbers.lastOrNull;

  void _configureAnimations() {
    final startPosition =
        DrawBoardHelper.calculateAnimatedBallNumberViewStartPosition(
            maxWidth: widget.width, gridViewHeight: _gridViewHeight);
    final double cellWidth =
        DrawBoardHelper.calculateBoardSectionCellWidth(maxWidth: widget.width);
    final cellHeight =
        cellWidth / DrawScreenConstants.drawBoardGridCellAspectRatio;
    final endPosition = _currentBallNumber != null
        ? DrawBoardHelper.calculateAnimatedBallNumberViewEndPosition(
            number: _currentBallNumber!,
            gridSectionHeight: widget.boardSectionHeight,
            cellWidth: cellWidth,
            cellHeight: cellHeight,
          )
        : startPosition;
    _positionAnimation = Tween<Offset>(
      begin: startPosition, // Starting position
      end: endPosition, // Ending position
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
      widget.boardSectionHeight * 2 +
      DrawScreenConstants.boardSectionVerticalGap;

  @override
  void didUpdateWidget(covariant DrawBoardContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.ballNumbers.lastOrNull != _currentBallNumber &&
        _currentBallNumber != null) {
      _startAnimation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _gridViewHeight,
      child: Stack(
        children: [
          Column(
            spacing: DrawScreenConstants.boardSectionVerticalGap,
            children: [
              DrawBoardSection(
                sectionType: DrawBoardSectionType.heads,
                height: widget.boardSectionHeight,
                ballNumbers: widget.ballNumbers,
              ),
              DrawBoardSection(
                sectionType: DrawBoardSectionType.tails,
                height: widget.boardSectionHeight,
                ballNumbers: widget.ballNumbers,
              )
            ],
          ),
          if (_currentBallNumber != null)
            AnimatedBuilder(
              animation: _positionAnimation,
              builder: (context, child) {
                return Positioned(
                    left: _positionAnimation.value.dx,
                    top: _positionAnimation.value.dy,
                    child: child!);
              },
              child: AnimatedBallNumberView(
                number: _currentBallNumber!,
                maxWidth: widget.width,
              ),
            )
        ],
      ),
    );
  }
}
