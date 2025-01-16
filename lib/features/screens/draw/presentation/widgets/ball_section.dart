import 'package:flutter/material.dart';
import 'package:my_draw/core/theme/gaps.dart';

class BallSection extends StatelessWidget {
  const BallSection({
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
      children: numbers.map((number) => Text(number.toString())).toList(),
    );
  }
}
