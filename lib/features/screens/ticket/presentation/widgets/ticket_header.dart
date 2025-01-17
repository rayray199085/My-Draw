import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_draw/features/screens/ticket/presentation/ticket_screen_constants.dart';

import '../../../../../core/theme/gaps.dart';
import '../../../../../generated/l10n.dart';
import '../cubit/ticket_cubit.dart';
import 'icon_text_button.dart';

class TicketHeader extends StatelessWidget {
  const TicketHeader({super.key, this.numberCount = 0});

  final int numberCount;
  @override
  Widget build(BuildContext context) {
    final remainingNumberCount =
        TicketScreenConstants.maxSelectedNumber - numberCount;
    return Column(
      spacing: Gaps.spacing16,
      children: [
        Text(
          _getTitleLabel(context: context, count: remainingNumberCount),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        Row(
          spacing: Gaps.spacing8,
          children: [
            IconTextButton(
              icon: Icons.clear,
              label: S.of(context).clear,
              onTap: () => context.read<TicketCubit>().clearSelectedNumbers(),
            ),
            IconTextButton(
              icon: Icons.vibration,
              label: S.of(context).auto,
              onTap: () =>
                  context.read<TicketCubit>().autoGenerateTicketNumbers(),
            )
          ],
        ),
      ],
    );
  }

  String _getTitleLabel({required BuildContext context, required int count}) {
    if (count == 0) {
      return S.of(context).allDone;
    } else if (count == 1) {
      return S.of(context).pickOneNumber;
    } else {
      return S.of(context).pickNumbers(count);
    }
  }
}
