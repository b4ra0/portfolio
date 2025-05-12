import 'package:dev_icons/dev_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:dev_icons/src/dev_icon_data.dart';

class Tool {
  Tool({
    required this.name,
    required this.icon,
});

  final String name;
  final IconData icon;

  factory Tool.fromJson(Map<String, dynamic> json) {
    return Tool(
      name: json['name'] as String,
      icon: DevIconData(json['icon'] as int),
    );
  }
}