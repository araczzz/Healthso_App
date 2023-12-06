import 'package:flutter/material.dart';
import 'package:healthso/constants/colour_constants.dart';
import 'package:intl/intl.dart';

class DateContainer extends StatelessWidget {
  final DateTime date;
  final bool isSelected;

  const DateContainer({
    super.key,
    required this.date,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          color: isSelected
              ? ColorConstants.primaryColour
              : ColorConstants.custDateBg,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${date.day}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            Text(
              DateFormat.E().format(date),
              style: TextStyle(
                fontSize: 15,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeSelector extends StatelessWidget {
  final DateTime selectedDate;
  final TimeOfDay? selectedTime;
  final Function(TimeOfDay) onSelectTime;

  const TimeSelector({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.onSelectTime,
  });

  @override
  Widget build(BuildContext context) {
    List<DateTime> hours = [];
    DateTime currentDate = DateTime.now();

    if (selectedDate.day == currentDate.day) {
      int currentHour = currentDate.hour;
      for (int i = currentHour; i < 24; i++) {
        hours.add(
            DateTime(currentDate.year, currentDate.month, currentDate.day, i));
      }
    } else {
      hours = List.generate(24, (index) {
        return DateTime(
            selectedDate.year, selectedDate.month, selectedDate.day, index);
      });
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: hours.map((hour) {
          return TimeContainer(
            time: hour,
            isSelected: selectedTime != null &&
                selectedTime!.hour == hour.hour &&
                selectedTime!.minute == hour.minute,
            onSelectTime: onSelectTime,
          );
        }).toList(),
      ),
    );
  }
}

class TimeContainer extends StatelessWidget {
  final DateTime time;
  final bool isSelected;
  final Function(TimeOfDay) onSelectTime;

  const TimeContainer({
    super.key,
    required this.time,
    required this.isSelected,
    required this.onSelectTime,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final selectedTime = TimeOfDay(hour: time.hour, minute: time.minute);
        onSelectTime(selectedTime);
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 33,
          width: 96,
          decoration: BoxDecoration(
            color: isSelected
                ? ColorConstants.primaryColour
                : ColorConstants.custDateBg,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat('hh:mm a').format(time),
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
