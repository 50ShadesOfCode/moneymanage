import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  final TextEditingController controller;
  const AuthInputField({required this.controller, required this.func});
  final void Function(String) func;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: 350,
      height: 40,
      child: TextField(
        controller: controller,
        onChanged: func,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: 'Username',
          fillColor: AppTheme.inactiveSecondaryColor,
          filled: true,
        ),
      ),
    );
  }
}
