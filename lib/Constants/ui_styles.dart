import 'package:flutter/material.dart';
import 'package:timezonesu/Constants/ui_colors.dart';

// ElevatedButton Styles
final acceptButtonStyle = ButtonStyle(
  backgroundColor: const MaterialStatePropertyAll<Color>(UIColors.primary),
  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(17),
    ),
  ),
);

final acceptButtonWithBorderStyle = acceptButtonStyle.copyWith(
  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(17),
      side: const BorderSide(width: 1, color: UIColors.white),
    ),
  ),
);

final normalButtonStyle = ButtonStyle(
  backgroundColor: const MaterialStatePropertyAll<Color>(UIColors.white),
  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(17),
    ),
  ),
);

final normalButtonWithBorderStyle = normalButtonStyle.copyWith(
  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(17),
      side: const BorderSide(width: 1, color: UIColors.buttonBorder),
    ),
  ),
);

//Input Styles
final authInputsStyle = InputDecoration(
  fillColor: UIColors.textFieldBackground,
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
  fillColor: UIColors.white,
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
    fontFamily: 'Red Hat Display',
  ),
);
