import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/gaps.dart';
import '../../../../../generated/l10n.dart';
import '../cubit/ticket_cubit.dart';
import 'icon_text_button.dart';

class TicketHeader extends StatelessWidget {
  const TicketHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
          onTap: () => context.read<TicketCubit>().autoGenerateTicketNumbers(),
        )
      ],
    );
  }
}
