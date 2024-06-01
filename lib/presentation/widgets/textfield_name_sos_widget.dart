import 'package:flutter/material.dart';

class TextFieldNameSOSWidget extends StatelessWidget {
  final dynamic controller;
  final String hintText;
  final bool obscureText;

  const TextFieldNameSOSWidget({
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
        validator: (value) {
        if (value.toString().isEmpty) {
          return 'Informe um nome de usuário para continuar';
        } else if (value.toString().length < 3) {
          return 'Este nome não é válido';
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