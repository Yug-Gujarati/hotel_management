import 'dart:ui';

import 'package:flutter/material.dart';

class RoomData {
  final String roomNumber;
  final Color color;
  final bool isAvailable;

  const RoomData({
    required this.roomNumber,
    required this.color,
  }) : isAvailable = color == Colors.blue;
}
