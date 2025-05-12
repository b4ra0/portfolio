import 'package:dev_icons/dev_icons.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_barao/components/icon_and_text.dart';

class ToolsTile extends StatelessWidget {
  const ToolsTile({super.key, required this.icon, required this.text, this.iconColor});

  final IconData icon;
  final String text;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconAndText(
          icon: icon,
          text: text,
          iconColor: iconColor,
        ),
      );
  }
}
