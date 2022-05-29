import 'package:flutter/services.dart';
class SketchWord {
  double width;
  double height;
  ByteData data;
  int index;
  SketchWord(this.height,this.width,this.data,this.index);
  SketchWord.fromStr(String wordStr) {

  }
}