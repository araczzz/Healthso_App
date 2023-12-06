import 'package:flutter/material.dart';
import 'package:healthso/constants/colour_constants.dart';

Widget buildCustomContainer({
  required IconData icon,
  required String text,
  String? info,
  String? btnText,
  VoidCallback? onPressed,
}) {
  double? containerHeight;
  if (info != null) {
    containerHeight = 96;
  } else {}

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Container(
      height: containerHeight,
      width: 343,
      margin: const EdgeInsets.only(top: 0, left: 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: ColorConstants.primaryColour,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    letterSpacing: 0,
                    height: 1.2,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onPressed,
                child: btnText != null
                    ? Container(
                        height: 30,
                        width: 96,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorConstants.primaryColour,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                btnText,
                                style: const TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  letterSpacing: 0,
                                  height: 1.2,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      )
                    : IconButton(
                        onPressed: onPressed,
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: ColorConstants.primaryColour,
                          size: 25,
                        ),
                      ),
              ),
            ],
          ),
          if (info != null) // Only display info if it's not null
            Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  info,
                  // Add any styling you want for the info text
                ),
              ],
            ),
        ],
      ),
    ),
  );
}
