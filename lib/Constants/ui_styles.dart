import 'package:flutter/material.dart';
import 'package:timezonesu/Constants/ui_colors.dart';

// ElevatedButton Styles
final acceptButtonStyle = ButtonStyle(
  elevation: const MaterialStatePropertyAll(0),
  backgroundColor: const MaterialStatePropertyAll<Color>(UIColors.primary),
  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(17),
    ),
  ),
  minimumSize: const MaterialStatePropertyAll<Size>(
    Size(double.infinity, 56),
  ),
);

final acceptButtonWithBorderStyle = acceptButtonStyle.copyWith(
  elevation: const MaterialStatePropertyAll(0),
  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(17),
      side: const BorderSide(width: 1, color: UIColors.white),
    ),
  ),
  minimumSize: const MaterialStatePropertyAll<Size>(
    Size(double.infinity, 56),
  ),
);

final normalButtonStyle = ButtonStyle(
  elevation: const MaterialStatePropertyAll(0),
  backgroundColor: const MaterialStatePropertyAll<Color>(UIColors.white),
  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(17),
    ),
  ),
);
final successButtonStyle = ButtonStyle(
  elevation: const MaterialStatePropertyAll(0),
  backgroundColor: const MaterialStatePropertyAll<Color>(UIColors.success),
  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(17),
    ),
  ),
);
final normalButtonWithBorderStyle = normalButtonStyle.copyWith(
  elevation: const MaterialStatePropertyAll(0),
  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(17),
      side: const BorderSide(width: 1, color: UIColors.buttonBorder),
    ),
  ),
  minimumSize: const MaterialStatePropertyAll<Size>(
    Size(double.infinity, 56),
  ),
);

final bannerButtonStyle = normalButtonStyle.copyWith(
  elevation: const MaterialStatePropertyAll(0),
  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
      side: const BorderSide(width: 1, color: UIColors.primary),
    ),
  ),
  minimumSize: const MaterialStatePropertyAll<Size>(
    Size(double.infinity, 56),
  ),
);

//Input Styles
final authInputsStyle = InputDecoration(
  filled: true,
  fillColor: UIColors.textFieldBackground,
  contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
  border: OutlineInputBorder(
    borderSide: const BorderSide(
      width: 1,
      color: UIColors.authTextFieldBorder,
    ),
    borderRadius: BorderRadius.circular(17),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      width: 1,
      color: UIColors.red,
    ),
    borderRadius: BorderRadius.circular(17),
  ),
  hintStyle: const TextStyle(
    color: UIColors.darknormalText,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontFamily: 'Red Hat Display',
  ),
);

final profileInputsStyle = InputDecoration(
  filled: true,
  fillColor: UIColors.white,
  contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
  border: OutlineInputBorder(
    borderSide: const BorderSide(
      width: 1,
      color: UIColors.authTextFieldBorder,
    ),
    borderRadius: BorderRadius.circular(17),
  ),
  hintStyle: const TextStyle(
    color: UIColors.darknormalText,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  ),
);

//Border Radius
const raduis10 = BorderRadius.all(Radius.circular(10));
const raduis15 = BorderRadius.all(Radius.circular(15));
const raduis20 = BorderRadius.all(Radius.circular(20));
const raduis20bottom = BorderRadius.only(
  bottomLeft: Radius.circular(20),
  bottomRight: Radius.circular(20),
);
const raduis30 = BorderRadius.all(Radius.circular(30));
const raduis40 = BorderRadius.all(Radius.circular(40));
const radius45topright = BorderRadius.only(topRight: Radius.circular(45));
const radius45topleft = BorderRadius.only(topLeft: Radius.circular(45));
const raduis50 = BorderRadius.all(Radius.circular(50));
