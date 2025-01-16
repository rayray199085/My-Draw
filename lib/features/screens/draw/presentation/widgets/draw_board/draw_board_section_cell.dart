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
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds:
              _DrawBoardSectionCellConstants.animationDurationInMilliseconds),
    );

    _sizeAnimation = Tween<double>(
            begin: _DrawBoardSectionCellConstants.scaleFactorFrom,
            end: _DrawBoardSectionCellConstants.scaleFactorTo)
        .animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse(); // Shrink back to normal size
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DrawCubit, DrawState, bool>(
      selector: (state) => state.maybeMap(
        loaded: (loaded) => loaded.ballNumbers.contains(widget.number),
        orElse: () => false,
      ),
      builder: (context, isSelected) {
        if (isSelected && !_isAnimating) {
          _isAnimating = true;
          _controller.forward().then((_) => _isAnimating = false);
        }

        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: isSelected
                  ? _sizeAnimation.value
                  : _DrawBoardSectionCellConstants.scaleFactorFrom,
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).colorScheme.tertiary
                      : Colors.black26,
                  borderRadius: BorderRadius.circular(RadiusValues.circular4),
                ),
                alignment: Alignment.center,
                child: isSelected
                    ? Text(
                        widget.number.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontWeight: FontWeight.bold,
                            ),
                      )
                    : const SizedBox.shrink(),
              ),
            );
          },
        );
      },
    );
  }
}
