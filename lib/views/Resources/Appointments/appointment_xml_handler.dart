import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:xml/xml.dart' as xml;
import 'dart:developer' as devtools show log;

class AppointmentXmlHandler {
  static const _fileName = 'appointments.xml';

  static Future<String> _getAppointmentsFilePath() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    return '${appDocDir.path}/$_fileName';
  }

  static Future<xml.XmlDocument> _readAppointmentsXml() async {
    final filePath = await _getAppointmentsFilePath();
    final file = File(filePath);

    if (await file.exists()) {
      final xmlString = await file.readAsString();
      try {
        return xml.XmlDocument.parse(xmlString);
      } catch (e) {
        devtools.log('Error parsing XML: $e');
        throw Exception('Error parsing XML');
      }
    } else {
      return xml.XmlDocument.parse('<appointments></appointments>');
    }
  }

  static Future<void> _writeAppointmentsXml(
      xml.XmlDocument appointmentsXml) async {
    final filePath = await _getAppointmentsFilePath();
    final file = File(filePath);
    await file.writeAsString(appointmentsXml.toXmlString(pretty: true));
  }

  static Future<void> addAppointment(xml.XmlElement appointmentElement) async {
    final appointmentsXml = await _readAppointmentsXml();
    appointmentsXml.root.children.add(appointmentElement);
    await _writeAppointmentsXml(appointmentsXml);
  }

  static Future<List<xml.XmlElement>> getAppointments() async {
    final appointmentsXml = await _readAppointmentsXml();
    return appointmentsXml.findAllElements('appointment').toList();
  }
}
