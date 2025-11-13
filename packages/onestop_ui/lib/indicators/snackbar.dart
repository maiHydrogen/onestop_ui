import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';

enum SnackbarType { positive, negative, warning, accent }

class OSnackbar extends StatelessWidget {
  final SnackbarType type;
  final String message;
  final IconData? icon;

  const OSnackbar({
    required this.type,
    required this.message,
    this.icon,
    super.key,
  });

  Color _getBackgroundColor() {
    switch (type) {
      case SnackbarType.positive:
        return OColor.green100;
      case SnackbarType.negative:
        return OColor.red100;
      case SnackbarType.warning:
        return OColor.yellow100;
      case SnackbarType.accent:
        return OColor.blue100;
    }
  }

  Color _getTextColor() {
    switch (type) {
      case SnackbarType.positive:
        return OColor.green700;
      case SnackbarType.negative:
        return OColor.red600;
      case SnackbarType.warning:
        return OColor.yellow800;
      case SnackbarType.accent:
        return OColor.blue800;
    }
  }

  IconData _getDefaultIcon() {
    switch (type) {
      case SnackbarType.positive:
        return Icons.check_circle;
      case SnackbarType.negative:
        return Icons.error;
      case SnackbarType.warning:
        return Icons.warning;
      case SnackbarType.accent:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: OSpacing.m,
        vertical: OSpacing.s,
      ),
      margin: EdgeInsets.all(OSpacing.s),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(OCornerRadius.s),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon ?? _getDefaultIcon(), color: _getTextColor(), size: 20),
          SizedBox(width: OSpacing.xs),
          Flexible(
            child: Text(
              message,
              style: OTextStyle.bodySmall.copyWith(color: _getTextColor()),
            ),
          ),
        ],
      ),
    );
  }
}
