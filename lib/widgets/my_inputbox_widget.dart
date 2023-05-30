import 'package:clothingapp/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyInputBoxWidget extends StatelessWidget {
  const MyInputBoxWidget({
    super.key,
    required this.textController,
    required this.textInputType,
    required this.hintText,
    required this.prefixIcon,
    required this.obsureStatus
  });

  final TextEditingController textController;
  final TextInputType textInputType;
  final String hintText;
  final IconData prefixIcon;
  final bool obsureStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0,left: 20),
      child: TextField(
        controller: textController,
        keyboardType: textInputType,
        obscureText: obsureStatus,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width:1,color: CustomColors.primaryColor)
          ),
          focusedBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width:1,color: CustomColors.primaryColor),
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.playfairDisplay(),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              // height: 60,
              // this container height is causing the error
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 1,
                    color: CustomColors.primaryColor,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Icon(prefixIcon,
                  color: CustomColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


