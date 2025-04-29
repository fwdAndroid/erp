import 'package:erp/uitl/colors.dart';
import 'package:flutter/material.dart';

class TextFormInputFeildWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool isPass;
  final String hintText;
  final int? maxlines;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged; // Optional onChanged callback

  final IconData? IconSuffix;
  final IconData? preFixICon;
  final TextInputType textInputType;

  const TextFormInputFeildWidget({
    Key? key,
    required this.controller,
    this.isPass = false,
    this.IconSuffix,
    this.onTap,
    this.onChanged, // Accepts onChanged function
    this.preFixICon,
    this.maxlines,
    required this.hintText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderStyle = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide: const BorderSide(color: Color(0xffF0F3F6)),
    );

    return Container(
      width: 343,
      height: 60,
      child: TextField(
        onTap: onTap,
        onChanged: onChanged, // Calls onChanged when text is updated
        maxLines: maxlines,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          suffixIcon: Icon(IconSuffix, color: suffixIcon),
          enabledBorder: borderStyle,
          focusedBorder: borderStyle,
          disabledBorder: borderStyle,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 16, color: hintColor),

          filled: true,
        ),
        keyboardType: textInputType,
        controller: controller,
        obscureText: isPass,
      ),
    );
  }
}
