import 'package:flutter/material.dart';
import 'package:my_draw/core/theme/gaps.dart';

import '../../../../../generated/l10n.dart';
import 'ball_number_cell.dart';

class BallSection extends StatelessWidget {
  const BallSection({
    super.key,
    required this.numbers,
  });

  final List<int> numbers;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${S.of(context).ballNumbers}:',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: Gaps.spacing8),
        Wrap(
          direction: Axis.horizontal,
          spacing: Gaps.spacing8,
          runSpacing: Gaps.spacing8,
          children:
              numbers.map((number) => BallNumberCell(number: number)).toList(),
        ),
      ],
    );
  }
}
