import 'package:flutter/material.dart';

class TextFieldCPFSOSWidget extends StatelessWidget {
  final dynamic controller;
  final String hintText;
  final bool obscureText;
  static const cpfRegex = r'^\d{3}\.\d{3}\.\d{3}\-\d{2}$';

  const TextFieldCPFSOSWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value.toString().isEmpty) {
            return 'Informe um CPF para continuar';
          } else if (!RegExp(cpfRegex).hasMatch(value.toString())) {
            return 'Esse CPF não é válido';
          }
          return null;
        },
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
