import 'package:flutter/material.dart';

class IconsModel {
  String title;
  IconData icon;
  String screen;
  IconsModel({required this.title, required this.icon, required this.screen});
}

List<IconsModel> homeIcons = [
  IconsModel(
    title: "Fashion",
    icon: Icons.content_cut_rounded,
    screen: "/fashion",
  ),
  IconsModel(
    title: "Delivery",
    icon: Icons.motorcycle_outlined,
    screen: "/delivery",
  ),
  IconsModel(
    title: "Electricals",
    icon: Icons.light_outlined,
    screen: "/electricals",
  ),
  IconsModel(
      title: "Plumbing",
      icon: Icons.format_color_reset_outlined,
      screen: "/plumbing"),
  IconsModel(
    title: "Lundary",
    icon: Icons.wb_sunny_sharp,
    screen: "/lundary",
  ),
  IconsModel(
    title: "Food or Snacks",
    icon: Icons.restaurant_menu_rounded,
    screen: "/food",
  ),
];
