import 'package:flutter/material.dart';

class AppTextBox extends StatelessWidget {
  const AppTextBox({
    super.key,
    this.hintText = "Text",
    this.labelText,
    this.controller,
    this.validator,
  });

  final String? hintText;
  final String? labelText;
  final Function(dynamic)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: TextFormField(
          controller: controller,
          validator: (event) {
            return validator!(event);
          },
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hintText,
            labelText: labelText
        ),
      ),
    );
  }
}