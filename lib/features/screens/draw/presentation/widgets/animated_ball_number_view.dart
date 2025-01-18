import 'package:flutter/material.dart';

import '../draw_screen_constants.dart';

class AnimatedBallNumberView extends StatefulWidget {
  final int number;

  const AnimatedBallNumberView({
    super.key,
    required this.number,
  });

  @override
  State<AnimatedBallNumberView> createState() => _AnimatedBallNumberViewState();
}

class _AnimatedBallNumberViewState extends State<AnimatedBallNumberView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

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
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));
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
        return Center(
          child: Transform.scale(
            scale: _scaleAnimation.value,
            alignment: Alignment.center,
            child: Container(
              width: DrawScreenConstants.animatedBallNumberWidth,
              height: DrawScreenConstants.animatedBallNumberHeight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              alignment: Alignment.center,
              child: Text(
                widget.number.toString(),
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
