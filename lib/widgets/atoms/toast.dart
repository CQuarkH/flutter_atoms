// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

enum ToastType { success, error, info, warning }

extension ParseToString on ToastType {
  String toShortString() {
    return toString().split('.').last;
  }
}

class ToastConfig {
  final IconData icon;
  final Color color;

  ToastConfig({required this.icon, required this.color});
}

Map<String, dynamic> TOAST_THEME = {
  'success': ToastConfig(icon: Icons.check_circle, color: Colors.green),
  'error': ToastConfig(icon: Icons.error, color: Colors.red),
  'info': ToastConfig(icon: Icons.info, color: Colors.blue),
  'warning': ToastConfig(icon: Icons.warning, color: Colors.orangeAccent),
};

class ToastSnackbar {
  static void show(BuildContext context, String message, ToastType? type,
      {bool? fillWithColor = false}) {
    final ToastConfig config =
        TOAST_THEME[type?.toShortString() ?? ToastType.info.name]!;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: fillWithColor! ? config.color : null,
        content: Row(
          children: [
            Icon(config.icon,
                color: fillWithColor ? Colors.white : config.color),
            const SizedBox(width: 16),
            Expanded(child: Text(message)),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(10),
        elevation: 4.0,
      ),
    );
  }
}
