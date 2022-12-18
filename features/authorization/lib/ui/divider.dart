import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AuthDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 150,
      child: Divider(
        thickness: 1,
        color: AppTheme.secondaryColor,
      ),
    );
  }
}
