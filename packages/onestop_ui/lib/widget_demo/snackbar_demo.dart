import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';

class SnackbarDemo extends StatelessWidget {
  const SnackbarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Divider(),
          Text(
            "SNACKBAR",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Divider(),
          SizedBox(height: 20),
          // Positive Snackbar
          OSnackbar(
            type: SnackbarType.positive,
            message: "Operation completed successfully!",
          ),
          SizedBox(height: 10),
          // Negative Snackbar
          OSnackbar(
            type: SnackbarType.negative,
            message: "An error occurred. Please try again.",
          ),
          SizedBox(height: 10),
          // Warning Snackbar
          OSnackbar(
            type: SnackbarType.warning,
            message: "Warning: This action cannot be undone.",
          ),
          SizedBox(height: 10),
          // Accent Snackbar
          OSnackbar(
            type: SnackbarType.accent,
            message: "Information: Check your settings.",
          ),
          SizedBox(height: 10),
          // Custom Icon Snackbar
          OSnackbar(
            type: SnackbarType.positive,
            message: "Custom icon example",
            icon: Icons.thumb_up,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
