import 'package:my_draw/core/constants/app_constants.dart';

import '../../../../../generated/l10n.dart';

enum DrawBoardSectionType {
  heads,
  tails,
}

extension DrawBordSectionTypeExtension on DrawBoardSectionType {
  String get label {
    switch (this) {
      case DrawBoardSectionType.heads:
        return S.current.heads;
      case DrawBoardSectionType.tails:
        return S.current.tails;
    }
  }

  int get startIndex {
    switch (this) {
      case DrawBoardSectionType.heads:
        return 0;
      case DrawBoardSectionType.tails:
        return AppConstants.totalTicketNumber ~/ 2;
    }
  }
}
