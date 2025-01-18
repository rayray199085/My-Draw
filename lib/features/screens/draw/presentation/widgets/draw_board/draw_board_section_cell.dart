import 'package:flutter/material.dart';
import 'package:my_draw/core/theme/cell_color_helper.dart';

import '../../../../../../core/theme/radius_values.dart';

class _DrawBoardSectionCellConstants {
  static const int animationDelayInSeconds = 1;
  static const int animationDurationInMilliseconds = 300;
  static const double scaleFactorFrom = 1.0;
  static const double scaleFactorTo = 1.2;
}

class DrawBoardSectionCell extends StatefulWidget {
  const DrawBoardSectionCell({
    super.key,
    required this.number,
    this.isSelected = false,
  });

  final int number;
  final bool isSelected;

  @override
  State<DrawBoardSectionCell> createState() => _DrawBoardSectionCellState();
}

class _DrawBoardSectionCellState extends State<DrawBoardSectionCell>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isSelected = false;

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
  void didUpdateWidget(covariant DrawBoardSectionCell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected &&
        widget.isSelected == true) {
      Future.delayed(
          const Duration(
              seconds: _DrawBoardSectionCellConstants.animationDelayInSeconds),
          () {
        _animationController.forward();
        _isSelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      maxHeight: double.infinity,
      maxWidth: double.infinity,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _isSelected
                ? _scaleAnimation.value
                : _DrawBoardSectionCellConstants.scaleFactorFrom,
            child: Container(
              decoration: BoxDecoration(
                color: _isSelected
                    ? CellColorHelper.getCellBackgroundColor(
                        number: widget.number)
                    : Theme.of(context).colorScheme.onTertiary,
                borderRadius: BorderRadius.circular(RadiusValues.circular4),
              ),
              alignment: Alignment.center,
              child: _isSelected
                  ? Text(
                      widget.number.toString(),
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  : const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
