import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_draw/features/screens/draw/presentation/cubit/draw_cubit.dart';

import '../../../../../../core/theme/radius_values.dart';

class _DrawBoardSectionCellConstants {
  static const int animationDurationInMilliseconds = 300;
  static const double scaleFactorFrom = 1.0;
  static const double scaleFactorTo = 1.2;
}

class DrawBoardSectionCell extends StatefulWidget {
  const DrawBoardSectionCell({
    super.key,
    required this.number,
  });

  final int number;

  @override
  State<DrawBoardSectionCell> createState() => _DrawBoardSectionCellState();
}

class _DrawBoardSectionCellState extends State<DrawBoardSectionCell>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds:
              _DrawBoardSectionCellConstants.animationDurationInMilliseconds),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: _DrawBoardSectionCellConstants.scaleFactorFrom,
          end: _DrawBoardSectionCellConstants.scaleFactorTo,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 1.0, // Duration proportion for this animation
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: _DrawBoardSectionCellConstants.scaleFactorTo,
          end: _DrawBoardSectionCellConstants.scaleFactorFrom,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 1.0,
      ),
    ]).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DrawCubit, DrawState, List<int>>(
      selector: (state) => state.maybeMap(
        loaded: (loaded) => loaded.ballNumbers,
        orElse: () => [],
      ),
      builder: (context, numbers) {
        final shouldHighlight = numbers.lastOrNull == widget.number;
        final hasSelected = numbers.contains(widget.number);
        if (shouldHighlight && !_isAnimating) {
          _isAnimating = true;
          _animationController.forward().then((_) => _isAnimating = false);
        }

        return OverflowBox(
          maxHeight: double.infinity,
          maxWidth: double.infinity,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.scale(
                scale: shouldHighlight
                    ? _scaleAnimation.value
                    : _DrawBoardSectionCellConstants.scaleFactorFrom,
                child: Container(
                  decoration: BoxDecoration(
                    color: hasSelected
                        ? Theme.of(context).colorScheme.tertiary
                        : Colors.black26,
                    borderRadius: BorderRadius.circular(RadiusValues.circular4),
                  ),
                  alignment: Alignment.center,
                  child: hasSelected
                      ? Text(
                          widget.number.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                fontWeight: FontWeight.bold,
                              ),
                        )
                      : const SizedBox.shrink(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
