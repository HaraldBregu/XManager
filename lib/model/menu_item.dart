import 'package:flutter/material.dart';
import 'package:xmanager/main.dart';

enum MenuType {header, item, footer}

class MenuItem {
  MenuItem({
    required this.title,
    this.route,
    this.menuType = MenuType.item,
    this.subtitle,
    this.icon,
  });

  final String title;
  final String? route;
  final String? subtitle;
  final Icon? icon;
  final MenuType menuType;
}