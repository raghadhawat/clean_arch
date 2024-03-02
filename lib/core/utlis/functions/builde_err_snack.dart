import 'package:flutter/material.dart';

SnackBar buildErrSnack(String errMessage) {
  return SnackBar(
    duration: const Duration(seconds: 2),
    content: Text(
      errMessage,
      style: const TextStyle(color: Colors.black),
    ),
  );
}
