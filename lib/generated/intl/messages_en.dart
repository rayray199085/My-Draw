// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) => "Pick ${count} numbers";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "allDone": MessageLookupByLibrary.simpleMessage("All done!"),
        "auto": MessageLookupByLibrary.simpleMessage("Auto"),
        "ballNumbers": MessageLookupByLibrary.simpleMessage("Ball numbers"),
        "clear": MessageLookupByLibrary.simpleMessage("Clear"),
        "draw": MessageLookupByLibrary.simpleMessage("Draw"),
        "heads": MessageLookupByLibrary.simpleMessage("Heads"),
        "pickNumbers": m0,
        "pickOneNumber": MessageLookupByLibrary.simpleMessage("Pick 1 number"),
        "start": MessageLookupByLibrary.simpleMessage("Start"),
        "tails": MessageLookupByLibrary.simpleMessage("Tails"),
        "ticket": MessageLookupByLibrary.simpleMessage("Ticket"),
        "ticketNumbers": MessageLookupByLibrary.simpleMessage("Ticket numbers")
      };
}
