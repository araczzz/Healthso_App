import 'package:flutter/material.dart';
import 'package:healthso/constants/colour_constants.dart';

Widget userProfile({
  required String userName,
  required String dateOfBirth,
  required String phoneNumber,
  required String imagePath,
  required VoidCallback onEditPressed,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      bottom: 24,
    ),
    child: Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 16),
      child: Container(
        width: 343,
        height: 120,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: 88,
                height: 88,
                child: Image.asset(
                  imagePath,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: ColorConstants.primaryColour,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        dateOfBirth,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 16,
                        color: ColorConstants.primaryColour,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        phoneNumber,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.edit,
                size: 25,
                color: ColorConstants.primaryColour,
              ),
              onPressed: onEditPressed,
            ),
          ],
        ),
      ),
    ),
  );
}
