import 'package:flutter/material.dart';

enum SnackbarType { failure, success }

SnackBar getSnackBar({SnackbarType type, String message}) {
  return SnackBar(
      duration: Duration(milliseconds: 500),
      backgroundColor:
          type == SnackbarType.success ? Colors.green[300] : Colors.red[300],
      content: Text(message, textAlign: TextAlign.center));
}
