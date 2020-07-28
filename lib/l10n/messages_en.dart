// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final MessageLookup messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final Map<String, Function> messages =
      _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(dynamic _) =>
      <String, Function>{
        "bmiInfoFirst": MessageLookupByLibrary.simpleMessage(
            "Body mass index, or BMI, is used to determine whether\n you are in a healthy weight range for your height."),
        "bmiInfoSecond": MessageLookupByLibrary.simpleMessage(
            "\n* This calculator shouldn\'t be used for pregnant women or children."),
        "bmiInterpretationNormal": MessageLookupByLibrary.simpleMessage(
            "You have a normal body weight. Great job!"),
        "bmiInterpretationOverweight": MessageLookupByLibrary.simpleMessage(
            "You have a higher than normal body weight. Try to exercise more."),
        "bmiInterpretationUnderweight": MessageLookupByLibrary.simpleMessage(
            "You have a lower than normal body weight. You can eat a bit more."),
        "female": MessageLookupByLibrary.simpleMessage("Female"),
        "gender": MessageLookupByLibrary.simpleMessage("GENDER"),
        "height": MessageLookupByLibrary.simpleMessage("HEIGHT"),
        "male": MessageLookupByLibrary.simpleMessage("Male"),
        "theBmiChart": MessageLookupByLibrary.simpleMessage("The BMI Chart"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "title": MessageLookupByLibrary.simpleMessage("BMI Calculator"),
        "weight": MessageLookupByLibrary.simpleMessage("WEIGHT"),
        "yourBmi": MessageLookupByLibrary.simpleMessage("YOUR BMI")
      };
}
