import 'package:flutter/foundation.dart';

enum ParticipantInfoMenu {
  polls,
  messages,
  content,
  chat,
  engagements,
  travel,
  invoices,
  history,
  unmapped,
}

extension ParticipantInfoMenuExtension on ParticipantInfoMenu {
  String toSqlString() => describeIdentity(this);
}

/// Generates a `Map<String, ParticipantInfoMenu>` containing each `ParticipantInfoMenu`.
///
/// Allows for cleaner `String` -> `enum` conversion with minimal maintenance
/// by checking if the `Map` contains the `String` key.
///
/// ```dart
/// var dbValue = 'none';
/// if(ParticipantInfoMenu.containsKey(value)) {
///   return participantInfoMenuMap[value]; // ParticipantInfoMenu.none
/// }
/// ```
final Map<String, ParticipantInfoMenu> participantInfoMenuMap = {
  for (var enumValue in ParticipantInfoMenu.values)
    enumValue.name.toString().toLowerCase(): enumValue
};
