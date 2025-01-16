import 'package:flutter/material.dart';
import 'package:my_draw/core/theme/gaps.dart';
import 'package:my_draw/core/theme/radius_values.dart';

class TicketSection extends StatelessWidget {
  const TicketSection({
    super.key,
    required this.numbers,
  });

  final List<int> numbers;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: Gaps.spacing8,
      runSpacing: Gaps.spacing8,
      children: numbers
          .map(
            (number) => Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(RadiusValues.circular4),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.tertiary,
                    )),
                alignment: Alignment.center,
                child: Text(
                  number.toString(),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                )),
          )
          .toList(),
    );
  }
}
