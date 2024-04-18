import 'package:flutter/material.dart';
import 'package:templat_project/widgets/widgets.dart';

class GlobalSnackBar {
  final String message;
  const GlobalSnackBar({
    required this.message,
  });

  static showSnackBar(
    BuildContext context,
    String message, {
    Color backgroundColor = Colors.black,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height - 100,
              right: 20,
              left: 20),
          showCloseIcon: true,
          closeIconColor: Colors.white,
          behavior: SnackBarBehavior.floating,
          content: SimpleText(
            message,
            color: Colors.white,
          ),
          backgroundColor: backgroundColor,
        ),
      );
  }
}
