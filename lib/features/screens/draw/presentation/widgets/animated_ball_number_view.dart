import 'package:flutter/material.dart';

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
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1), // Total duration for the animation
      vsync: this,
    );

    _initializeAnimations();

    _controller.forward(); // Start the animation initially
  }

  void _initializeAnimations() {
    // Define size animation (grow and shrink)
    _sizeAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 100, end: 0).chain(
          CurveTween(curve: Curves.easeIn),
        ),
        weight: 1,
      ),
    ]).animate(_controller);
  }

  @override
  void didUpdateWidget(covariant AnimatedBallNumberView oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Restart the animation when the number or target position changes
    if (widget.number != oldWidget.number) {
      _controller.reset();
      _initializeAnimations(); // Reinitialize position animation
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Center(
          child: Transform.scale(
            scale: _sizeAnimation.value / 100,
            alignment: Alignment.center,
            child: Container(
              width: 100.0,
              height: 100.0,
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
