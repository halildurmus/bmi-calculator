// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a tr locale. All the
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
  String get localeName => 'tr';

  final Map<String, Function> messages =
      _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(dynamic _) =>
      <String, Function>{
        "bmiInfoFirst": MessageLookupByLibrary.simpleMessage(
            "Vücut kitle indeksi veya BMI, boyunuza göre sağlıklı bir kilo\n aralığında olup olmadığınızı belirlemek için kullanılır."),
        "bmiInfoSecond": MessageLookupByLibrary.simpleMessage(
            "\n* Bu hesaplayıcı hamile kadınlar veya çocuklar için kullanılmamalıdır."),
        "bmiInterpretationNormal": MessageLookupByLibrary.simpleMessage(
            "Normal bir vücut ağırlığınız var. Harika!"),
        "bmiInterpretationOverweight": MessageLookupByLibrary.simpleMessage(
            "Ağırlığın, normal vücut ağırlığından daha yüksek. Daha fazla egzersiz yapmaya çalış."),
        "bmiInterpretationUnderweight": MessageLookupByLibrary.simpleMessage(
            "Ağırlığın, normal vücut ağırlığından daha düşük. Biraz daha yiyebilirsin."),
        "female": MessageLookupByLibrary.simpleMessage("Kadın"),
        "gender": MessageLookupByLibrary.simpleMessage("CİNSİYET"),
        "height": MessageLookupByLibrary.simpleMessage("BOY"),
        "male": MessageLookupByLibrary.simpleMessage("Erkek"),
        "theBmiChart": MessageLookupByLibrary.simpleMessage("BMI Grafiği"),
        "close": MessageLookupByLibrary.simpleMessage("Kapat"),
        "title": MessageLookupByLibrary.simpleMessage("BMI Hesaplayıcı"),
        "weight": MessageLookupByLibrary.simpleMessage("AĞIRLIK"),
        "yourBmi": MessageLookupByLibrary.simpleMessage("BMI DEĞERİN")
      };
}
