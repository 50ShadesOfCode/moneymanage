import 'package:flutter/material.dart';
import 'package:moneymanage/feature/error_view/error_page.dart';

class ErrorRoute {
  static Page<dynamic> page(String title) => ErrorPage(message: title);
}
