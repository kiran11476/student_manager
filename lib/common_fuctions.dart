import 'package:flutter/material.dart';

Widget gap({required double Height, required double Width}) {
  return SizedBox(
    height: Height,
    width: Width,
  );
}



Widget textField({
  required String labelText,
  required valueController,
  required TextInputType type,
}) {
  return Column(
    children: [
      gap(Height: 15, Width: 0),
      TextFormField(
        keyboardType: type,
        controller: valueController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Fields can not be empty";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 247, 226, 226),
          filled: true,
          label: Text(labelText),
        ),
      ),
    ],
  );
}