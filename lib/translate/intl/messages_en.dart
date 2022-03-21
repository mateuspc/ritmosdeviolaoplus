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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "app_name": MessageLookupByLibrary.simpleMessage("Ritmos de violão"),
        "buy": MessageLookupByLibrary.simpleMessage("BUY"),
        "lifetime": MessageLookupByLibrary.simpleMessage("Lifetime"),
        "lifetime_plan_description": MessageLookupByLibrary.simpleMessage(
            "In the lifetime plan, you pay only once and have access to all the features of the app!"),
        "no_purchase_not_found":
            MessageLookupByLibrary.simpleMessage("No purchase not found"),
        "options": MessageLookupByLibrary.simpleMessage("Options"),
        "other_apps": MessageLookupByLibrary.simpleMessage("Other Apps"),
        "privacy_policy":
            MessageLookupByLibrary.simpleMessage("Privacy policy"),
        "restore_purchases":
            MessageLookupByLibrary.simpleMessage("Restore purchases"),
        "restore_successfully": MessageLookupByLibrary.simpleMessage(
            "Purchase successfully restored"),
        "share": MessageLookupByLibrary.simpleMessage("Share"),
        "share_with_friend":
            MessageLookupByLibrary.simpleMessage("Share with friend"),
        "team_contact": MessageLookupByLibrary.simpleMessage("Team contact"),
        "terms_of_use": MessageLookupByLibrary.simpleMessage("Terms of use")
      };
}
