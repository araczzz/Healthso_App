import 'package:flutter/material.dart';
import 'package:healthso/constants/colour_constants.dart';
import 'package:healthso/views/Resources/Appointments/appointment_xml_handler.dart';
import 'package:healthso/views/Resources/Doctors/doctor_model.dart';
import 'dart:developer' as devtools show log;

class CurrAppointment extends StatefulWidget {
  final Doctor doctor;
  const CurrAppointment({
    Key? key,
    required this.doctor,
  }) : super(key: key);

  @override
  State<CurrAppointment> createState() => _CurrAppointmentState();
}

class _CurrAppointmentState extends State<CurrAppointment> {
  @override
  Widget build(BuildContext context) {
    final doctor = widget.doctor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'My Appointment',
          style: TextStyle(
            color: ColorConstants.primaryColour,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          color: ColorConstants.primaryColour,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: 400,
              height: 272,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 246, 246, 246)
                        .withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(doctor.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: 400,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 246, 246, 246)
                        .withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        doctor.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${doctor.ratings} (${doctor.reviewsCount} reviews)',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${doctor.domain} | ${doctor.hospitalName}',
                    style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(223, 142, 138, 138)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildIconWithText(
                  Icons.people,
                  '${doctor.patientCount}+',
                  'Patients',
                ),
                _buildIconWithText(
                  Icons.gif_box,
                  '${doctor.experienceYearsCount}+',
                  'Year Expert',
                ),
                _buildIconWithText(
                  Icons.star,
                  doctor.ratings,
                  'Ratings',
                ),
                _buildIconWithText(
                  Icons.chat_bubble,
                  '${doctor.reviewsCount}+',
                  'Reviews',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.only(left: 5, right: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Patient Information',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Full Name: Richard Lee',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ElevatedButton(
              onPressed: () {
                // Call the function to read and log the data from the XML file
                readAppointmentsFromXml();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(327, 52),
                backgroundColor: ColorConstants.primaryColour,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0.0,
              ),
              child: const Text(
                'Start Voice Call (14.30 - 15.00 PM)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconWithText(IconData icon, String topText, String bottomText) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Adjust the padding as needed
      child: Container(
        width: 80, // Adjust the width as needed
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 246, 246, 246).withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8), // Adjust padding as needed
          child: Column(
            children: [
              Icon(
                icon,
                color: ColorConstants.primaryColour,
                size: 20, // Adjust the icon size as needed
              ),
              const SizedBox(height: 2), // Adjust the spacing as needed
              Text(
                topText,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 10, // Adjust the font size as needed
                ),
              ),
              Text(
                bottomText,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 8, // Adjust the font size as needed
                ),
              ),
            ],
          ),
        ),
      ),


    );
  }
}

Future<void> readAppointmentsFromXml() async {
  final appointments = await AppointmentXmlHandler.getAppointments();
  for (var appointment in appointments) {
    final doctorId = appointment.getAttribute('doctorId');
    final patientId = appointment.getAttribute('patientId');
    final dateTime = appointment.getAttribute('dateTime');
    devtools.log(
        'Doctor ID: $doctorId, Patient ID: $patientId, DateTime: $dateTime');
  }
}
