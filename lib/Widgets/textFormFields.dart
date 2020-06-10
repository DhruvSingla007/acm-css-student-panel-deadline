import 'package:flutter/material.dart';

class BuildTextFormFields extends StatelessWidget {
  final String errorMessage;
  final String hintText;
  final Icon preIcon;
  final TextEditingController editingController;

  BuildTextFormFields({
    this.errorMessage,
    this.hintText,
    this.editingController,
    this.preIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return errorMessage;
          }
          return null;
        },
        controller: editingController,
        decoration: InputDecoration(
          prefixIcon: preIcon,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
