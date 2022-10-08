import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinBoxField extends StatefulWidget {

  TextEditingController textController = TextEditingController();

  PinBoxField({Key? key, required this.textController}) : super(key: key);

  @override
  State<PinBoxField> createState() => _PinBoxFieldState();
}

class _PinBoxFieldState extends State<PinBoxField> {
  @override
  Widget build(BuildContext context) {
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color.fromRGBO(222, 231, 240, .57);
    final defaultPinTheme = PinTheme(
      width: 63,
      height: 70,
      textStyle: const TextStyle(fontSize: 22, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: fillColor,
        
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );
    return Pinput(
      keyboardType: TextInputType.text,
      length: 5,
      controller: widget.textController,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyWith(
        height: 75,
        width: 64,
        decoration: defaultPinTheme.decoration?.copyWith(
          border: Border.all(color: Colors.black),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: errorColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}