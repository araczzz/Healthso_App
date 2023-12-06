import 'package:shared_preferences/shared_preferences.dart';

class Patient {
  static Patient? currentPatient;

  final int id;
  final String name;

  Patient({
    required this.id,
    required this.name,
  });

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('patient_id', id);
    await prefs.setString('patient_name', name);
  }

  static Future<Patient?> load() async {
    final prefs = await SharedPreferences.getInstance();
    final patientId = prefs.getInt('patient_id');
    final patientName = prefs.getString('patient_name');
    if (patientId != null && patientName != null) {
      return Patient(id: patientId, name: patientName);
    }
    return null;
  }
}
