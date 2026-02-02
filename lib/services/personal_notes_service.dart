import 'package:shared_preferences/shared_preferences.dart';

class PersonalNotesService {
  static const _prefix = 'personal_note_';

  static Future<String?> getNote(String pointId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('$_prefix$pointId');
  }

  static Future<void> saveNote(String pointId, String note) async {
    final prefs = await SharedPreferences.getInstance();
    if (note.trim().isEmpty) {
      await prefs.remove('$_prefix$pointId');
    } else {
      await prefs.setString('$_prefix$pointId', note.trim());
    }
  }

  static Future<bool> hasNote(String pointId) async {
    final note = await getNote(pointId);
    return note != null && note.isNotEmpty;
  }
}
