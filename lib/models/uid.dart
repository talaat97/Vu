import 'package:flutter/material.dart';
import '../services/theme_services.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(7),
        backgroundColor: MaterialStateProperty.all<Color>(
          ThemeManager.deepBlue
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}

void showSnakeBar(context, content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: content));
}
