
import 'package:flutter/material.dart';
import 'key_action.dart';
import 'key_type.dart';
/// Virtual Keyboard key
class VirtualKeyboardKey {
  final String text;
  final String capsText;
  final VirtualKeyboardKeyType keyType;
  final VirtualKeyboardKeyAction action;

  VirtualKeyboardKey(
      {this.text, this.capsText, @required this.keyType, this.action});
}
