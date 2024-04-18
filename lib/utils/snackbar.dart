import 'package:flutter/material.dart';
import 'package:test_1/constants/colors.dart';

customSnackbar(context, bool error, String messege) {
  return SnackBar(
    content: Text(
      messege,
    ),
    backgroundColor: error ? AppColors.green : AppColors.red,
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}
