import 'package:flutter/material.dart';
import 'package:timezonesu/Constants/ui_colors.dart';
import 'package:timezonesu/Constants/ui_text_style.dart';

class SuTextForm extends StatelessWidget {
  const SuTextForm(
      {super.key,
      required this.hint,
      required this.obsecure,
      required this.controller,
      this.type = TextInputType.text});
  final TextEditingController controller;

  final String hint;
  final bool obsecure;
  final TextInputType type;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: UITextStyle.boldMeduim.apply(color: UIColors.blue),
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        filled: true,
        fillColor: UIColors.white,
        border: const OutlineInputBorder(),
        hintText: hint,
        hintStyle: UITextStyle.normalBody.apply(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: UIColors.blue),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: UIColors.darkGrey)),
      ),
      maxLines: 1,
      obscureText: obsecure,
    );
  }
}
