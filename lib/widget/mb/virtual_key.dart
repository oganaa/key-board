
import 'package:flutter/material.dart';
import 'vkey_action.dart';
import 'vkey_type.dart';
/// Virtual Keyboard key
class VirtualKeyboardKey {
  final String text;
  final String capsText;
  final VirtualKeyboardKeyType keyType;
  final VirtualKeyboardKeyAction action;

  VirtualKeyboardKey(
      {this.text, this.capsText, @required this.keyType, this.action});
}
