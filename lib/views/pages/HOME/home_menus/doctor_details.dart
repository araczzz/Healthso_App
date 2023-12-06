// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healthso/constants/colour_constants.dart';
import 'package:healthso/views/Resources/Appointments/appointment_manager.dart';
import 'package:healthso/views/Resources/Doctors/doctor_model.dart';
import 'package:healthso/views/pages/APPOINTMENT/current_appointment.dart';
import 'package:healthso/views/pages/HOME/home_menus/date_time_components.dart';
import 'dart:developer' as devtools show log;

class DocDetails extends StatefulWidget {
  final Doctor doctor;

  const DocDetails({
    Key? key,
    required this.doctor,
  }) : super(key: key);

  @override
  State<DocDetails> createState() => _DocDetailsState();
}

class _DocDetailsState extends State<DocDetails> {
  List<DateTime> dates = [];
  int selectedDateIndex = -1;
  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();
    DateTime currentDate = DateTime.now();
    for (int i = 0; i < 7; i++) {
      dates.add(currentDate.add(Duration(days: i)));
    }
    selectedDateIndex = 0;
  }

  void selectDate(int index) {
    setState(() {
      selectedDateIndex = index;
      selectedTime = null;
    });
  }

  void selectTime(TimeOfDay time) {
    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    final doctor = widget.doctor;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                doctor.imagePath,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Other widgets inside the SingleChildScrollView
                    ],
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height - 570,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: 32,
                  left: 20,
                  right: 20,
                  bottom: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          doctor.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: ColorConstants.ratingStar,
                              size: 20,
                            ),
                            Text(doctor.ratings),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      doctor.domain,
                      style: const TextStyle(
                        fontSize: 14,
                        fontFamily: "Raleway",
                      ),
                    ),
                    const SizedBox(height: 10),
                    Divider(color: Colors.black),
                    Text(
                      "Descriptions",
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(doctor.bio),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Read More....",
                        style: TextStyle(color: ColorConstants.primaryColour),
                      ),
                    ),
                    Divider(color: Colors.black),
                    Text(
                      "Select Date",
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // displays upcoming 7 days with correct date and day
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          dates.length,
                          (index) => GestureDetector(
                            onTap: () => selectDate(index),
                            child: DateContainer(
                              date: dates[index],
                              isSelected: selectedDateIndex == index,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Text(
                    //   selectedDateIndex != -1
                    //       ? "Selected Date: ${dates[selectedDateIndex].toString()}"
                    //       : "No date selected",
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),

                    SizedBox(height: 10),
                    Text(
                      "Select Time",
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // displays upcoming hours till 24hrs
                    selectedDateIndex != -1
                        ? TimeSelector(
                            selectedDate: dates[selectedDateIndex],
                            selectedTime: selectedTime,
                            onSelectTime: selectTime,
                          )
                        : Container(),

                    // selectedTime != null
                    //     ? Text(
                    //         "Selected Time: ${selectedTime!.format(context)}",
                    //         style: TextStyle(
                    //           fontSize: 18,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       )
                    //     : Container(),

                    SizedBox(height: 23),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 154,
                          height: 42,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorConstants.primaryColour),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Send Message",
                              style: TextStyle(
                                color: ColorConstants.primaryColour,
                                fontSize: 12,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 154,
                          height: 42,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorConstants.primaryColour),
                              borderRadius: BorderRadius.circular(8.0),
                              color: ColorConstants.primaryColour),
                          child: TextButton(
                            onPressed: () {
                              if (selectedDateIndex != -1 &&
                                  selectedTime != null) {
                                final selectedDateTime = DateTime(
                                  dates[selectedDateIndex].year,
                                  dates[selectedDateIndex].month,
                                  dates[selectedDateIndex].day,
                                  selectedTime!.hour,
                                  selectedTime!.minute,
                                );
                                // Save the appointment
                                AppointmentManager.saveAppointment(
                                    doctor: doctor,
                                    selectedDateTime: selectedDateTime);

                                devtools.log('Appointment saved:');
                                devtools.log('Doctor: ${doctor.name}');
                                devtools
                                    .log('Date and Time: $selectedDateTime');

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CurrAppointment(doctor: doctor),
                                  ),
                                );
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Please select a date and time.');
                              }
                            },
                            child: const Text(
                              "Book Appointment",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
