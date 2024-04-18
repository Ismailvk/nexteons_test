import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final FormFieldValidator<String?>? validator;
  final TextEditingController controller;
  const TextFormFieldWidget(
      {super.key, required this.controller, required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            errorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
