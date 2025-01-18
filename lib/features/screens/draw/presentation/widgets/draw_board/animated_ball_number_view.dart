import 'package:flutter/material.dart';
import 'package:my_draw/core/theme/radius_values.dart';
import 'package:my_draw/features/screens/draw/presentation/utils/draw_board_helper.dart';

import '../../draw_screen_constants.dart';

const double _textScaleEndValue = 0.375;

class AnimatedBallNumberView extends StatefulWidget {
  final int number;
  final double maxWidth;

  const AnimatedBallNumberView({
    super.key,
    required this.number,
    required this.maxWidth,
  });

  @override
  State<AnimatedBallNumberView> createState() => _AnimatedBallNumberViewState();
}

class _AnimatedBallNumberViewState extends State<AnimatedBallNumberView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<BorderRadius> _borderRadiusAnimation;
  late Animation<double> _widthAnimation;
  late Animation<double> _heightAnimation;
  late Animation<double> _textScaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(
          seconds: DrawScreenConstants.scaleAnimationDurationInSeconds),
      vsync: this,
    );

    _configureAnimations();

    _animationController.forward();
  }

  void _configureAnimations() {
    _borderRadiusAnimation = Tween<BorderRadius>(
      begin: BorderRadius.circular(
          DrawScreenConstants.animatedBallNumberWidth / 2.0),
      end: BorderRadius.circular(RadiusValues.circular4),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    final cellWidth =
        DrawBoardHelper.getGridCellWidth(maxWidth: widget.maxWidth);
    final cellHeight =
        cellWidth / DrawScreenConstants.drawBoardGridCellAspectRatio;

    _widthAnimation = Tween<double>(
      begin: DrawScreenConstants.animatedBallNumberWidth,
      end: cellWidth,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _heightAnimation = Tween<double>(
      begin: DrawScreenConstants.animatedBallNumberHeight,
      end: cellHeight,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _textScaleAnimation = Tween<double>(
      begin: 1.0,
      end: _textScaleEndValue,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(covariant AnimatedBallNumberView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.number != oldWidget.number) {
      _animationController.reset();
      _configureAnimations();
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          width: _widthAnimation.value,
          height: _heightAnimation.value,
          decoration: BoxDecoration(
            borderRadius: _borderRadiusAnimation.value,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          alignment: Alignment.center,
          child: Text(
            widget.number.toString(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.bold,
              fontSize:
                  (Theme.of(context).textTheme.headlineLarge?.fontSize ?? 0.0) *
                      _textScaleAnimation.value,
            ),
          ),
        );
      },
    );
  }
}
