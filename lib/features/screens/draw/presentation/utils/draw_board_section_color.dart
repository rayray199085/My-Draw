import 'package:flutter/material.dart';

import '../enums/draw_board_section_type.dart';

Color getDrawBoardSectionPrimaryColor({
  required BuildContext context,
  required DrawBoardSectionType type,
}) {
  switch (type) {
    case DrawBoardSectionType.heads:
      return Theme.of(context).colorScheme.tertiary;
    case DrawBoardSectionType.tails:
      return Theme.of(context).colorScheme.primary;
  }
}
