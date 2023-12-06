import 'package:healthso/views/Resources/Appointments/appointment_xml_handler.dart';
import 'package:healthso/views/Resources/Doctors/doctor_model.dart';
import 'package:xml/xml.dart' as xml;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healthso/views/Resources/Patients/patient.dart';

class AppointmentManager {
  static Future<void> saveAppointment({
    required Doctor doctor,
    required DateTime selectedDateTime,
  }) async {
    final currentPatient = Patient.currentPatient;
    if (currentPatient != null) {
      final selectedDoctorId = doctor.docId;

      final appointmentElement = xml.XmlElement(
        xml.XmlName('appointment'),
        [
          xml.XmlAttribute(
              xml.XmlName('doctorId'), selectedDoctorId.toString()),
          xml.XmlAttribute(
              xml.XmlName('patientId'), currentPatient.id.toString()),
          xml.XmlAttribute(
              xml.XmlName('dateTime'), selectedDateTime.toString()),
        ],
        [],
      );

      await AppointmentXmlHandler.addAppointment(appointmentElement);

      Fluttertoast.showToast(msg: 'Appointment booked successfully.');
    } else {
      Fluttertoast.showToast(msg: 'Patient information not available.');
    }
  }
}
