import 'package:firebase_concept/src/components/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomOrangeButton extends StatelessWidget {
  final String txt;
  final VoidCallback? onTap;
  const CustomOrangeButton({super.key, required this.txt, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(txt, style: AppTextStyle.body)),
      ),
    );
  }
}
