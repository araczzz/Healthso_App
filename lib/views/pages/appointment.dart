import 'package:flutter/material.dart';
import 'package:healthso/constants/colour_constants.dart';
import 'package:healthso/views/Resources/Doctors/doctor_data.dart';
import 'package:healthso/views/Resources/Doctors/doctor_model.dart';
import 'package:healthso/views/pages/HOME/home_menus/doctor_details.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Text(
          'My Appointments',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}

Widget customAppointmentDetails({
  required BuildContext context,
  required int docId,
}) {
  // Retrieve doctor details using docId from DoctorData.doctors list
  Doctor doctor = DoctorData.doctors.firstWhere((doc) => doc.docId == docId);

  return Padding(
    padding: const EdgeInsets.only(bottom: 11.0),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DocDetails(
              doctor: doctor,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: ColorConstants.customDocDetailsBg,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox(
                    height: 79,
                    width: 77,
                    child: Image.asset(
                      doctor.imagePath, // Use doctor.imagePath
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name, // Use doctor.name
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      doctor.domain, // Use doctor.domain
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: "Raleway",
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined),
                        Text(
                            '${doctor.distance}km away'), // Use doctor.distance
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: ColorConstants.ratingStar,
                    ),
                    Text(doctor.ratings), // Use doctor.ratings
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
