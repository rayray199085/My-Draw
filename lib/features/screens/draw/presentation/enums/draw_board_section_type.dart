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
}
