import 'package:flutter/material.dart';
import 'package:my_draw/core/router/app_route.dart';

import '../../../generated/l10n.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).ticket),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => DrawRoute().push(context),
                child: Text(
                  S.of(context).start,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                ))
          ],
        ),
      )),
    );
  }
}
