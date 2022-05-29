
import 'package:flutter/material.dart';
import 'package:keyboard/type.dart';
import 'package:mongol/mongol.dart';
import 'key.dart';
import 'key_action.dart';
import 'key_type.dart';
import 'keyboard.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KeyBoard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'KeyBoard'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  String text = "";
  bool bigger=false;
  // True if shift enabled.
  bool shiftEnabled = false;

  // is true will show the numeric keyboard.
  bool isNumericMode = false;
  bool isMongol = true;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    MongolText(text,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Classical Mongolian Dashtseden')),
                  ],
                ),
              ),
            ),
            Expanded(
              child:Stack(
              ),
            ),
            Container(
              color: Colors.grey[200],
              child: VirtualKeyboard(
                  height: 230,
                  mon: isNumericMode ? false : (isMongol ? true : true),
                  //textColor: Colors.black,
                  type: isNumericMode
                      ? VirtualKeyboardType.Numeric
                      : (isMongol
                          ? VirtualKeyboardType.Alphanumeric
                          : VirtualKeyboardType.Mons),
                  onKeyPress: _onKeyPress),
            ),
            Container(
              color: Colors.grey[200],
              //textColor: Colors.black,),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  bool check_Tiin(String word) {
    //харьяалахын тйин ялгал
    if (word.length == 1 &&
        (word.substring(0, 1) == 'ᠦ' || word.substring(0, 1) == 'ᠤ')) {
      return true;
    }
    if (word.length == 2 &&
        (word.substring(0, 2) == 'ᠦᠨ' || word.substring(0, 2) == 'ᠤᠨ')) {
      return true;
    }
    if (word.length == 3 && (word.substring(0, 3) == 'ᠶᠢᠨ')) {
      return true;
    }
    //заахын тийн ялгал
    if (word.length == 1 && (word.substring(0, 1) == 'ᠢ')) {
      return true;
    }
    if (word.length == 2 && (word.substring(0, 2) == 'ᠶᠢ')) {
      return true;
    }
    //өгөх оршихийн тйин ялгал
    if (word.length == 2 &&
        (word.substring(0, 2) == 'ᠳᠤ' || word.substring(0, 2) == 'ᠳᠦ')) {
      return true;
    }
    if (word.length == 3 &&
        (word.substring(0, 3) == 'ᠳᠤᠷ' || word.substring(0, 3) == 'ᠳᠦᠷ')) {
      return true;
    }
    if (word.length == 2 &&
        (word.substring(0, 2) == 'ᠲᠤ' || word.substring(0, 2) == 'ᠲᠦ')) {
      return true;
    }
    if (word.length == 3 &&
        (word.substring(0, 3) == 'ᠲᠤᠷ' || word.substring(0, 3) == 'ᠲᠦᠷ')) {
      return true;
    }
    //гарахын тийн ялгал
    if (word.length == 3 &&
        (word.substring(0, 3) == 'ᠠᠴᠠ' || word.substring(0, 3) == 'ᠡᠴᠡ')) {
      return true;
    }
    //үйлдэхийн тийн ялгал
    if (word.length == 3 &&
        (word.substring(0, 3) == 'ᠪᠠᠷ' || word.substring(0, 3) == 'ᠪᠡᠷ')) {
      return true;
    }
    if (word.length == 4 &&
        (word.substring(0, 4) == 'ᠢᠶᠠᠷ' || word.substring(0, 4) == 'ᠢᠶᠡᠷ')) {
      return true;
    }
    // olon too
    if (word.length == 2 &&
        (word.substring(0, 2) == 'ᠤᠳ' || word.substring(0, 2) == 'ᠦᠳ')) {
      return true;
    }
    return false;
  }
  String get_Tiin(String word) {
    //харьяалахын тйин ялгал
    if (word.length == 1 &&
        (word.substring(0, 1) == 'ᠦ' || word.substring(0, 1) == 'ᠤ')) {
      return '\u202F\u1826';
    }
    if (word.length == 2 &&
        (word.substring(0, 2) == 'ᠦᠨ' || word.substring(0, 2) == 'ᠤᠨ')) {
      return '\u202F\u1826\u1828';
    }
    if (word.length == 3 && (word.substring(0, 3) == 'ᠶᠢᠨ')) {
      return '\u202F\u1836\u1822\u1828';
    }
    //заахын тийн ялгал
    if (word.length == 1 && (word.substring(0, 1) == 'ᠢ')) {
      return '\u202F\u1822';
    }
    if (word.length == 2 && (word.substring(0, 2) == 'ᠶᠢ')) {
      return '\u202F\u1836\u1822';
    }
    //өгөх оршихийн тйин ялгал
    if (word.length == 2 &&
        (word.substring(0, 2) == 'ᠳᠤ' || word.substring(0, 2) == 'ᠳᠦ')) {
      return '\u202F\u1833\u1826';
    }
    if (word.length == 3 &&
        (word.substring(0, 3) == 'ᠳᠤᠷ' || word.substring(0, 3) == 'ᠳᠦᠷ')) {
      return '\u202F\u1833\u1826\u1837';
    }
    if (word.length == 2 &&
        (word.substring(0, 2) == 'ᠲᠤ' || word.substring(0, 2) == 'ᠲᠦ')) {
      return '\u202F\u1832\u1826';
    }
    if (word.length == 3 &&
        (word.substring(0, 3) == 'ᠲᠤᠷ' || word.substring(0, 3) == 'ᠲᠦᠷ')) {
      return '\u202F\u1832\u1826\u1837';
    }
    //гарахын тийн ялгал
    if (word.length == 3 &&
        (word.substring(0, 3) == 'ᠠᠴᠠ' || word.substring(0, 3) == 'ᠡᠴᠡ')) {
      return '\u202F\u1820\u1834\u1820';
    }
    //үйлдэхийн тийн ялгал
    if (word.length == 3 &&
        (word.substring(0, 3) == 'ᠪᠠᠷ' || word.substring(0, 3) == 'ᠪᠡᠷ')) {
      return '\u202F\u182A\u1820\u1837';
    }
    if (word.length == 4 &&
        (word.substring(0, 4) == 'ᠢᠶᠠᠷ' || word.substring(0, 4) == 'ᠢᠶᠡᠷ')) {
      return '\u202F\u1822\u1836\u1821\u1837';
    }
    // olon too
    if (word.length == 2 &&
        (word.substring(0, 2) == 'ᠤᠳ' || word.substring(0, 2) == 'ᠦᠳ')) {
      return '\u202F\u1824\u1833';
    }
    return '';
  }

  /// Fired when the virtual keyboard key is pressed.
  _onKeyPress(VirtualKeyboardKey key) {
    if (key.keyType == VirtualKeyboardKeyType.String) {
      text = text + (shiftEnabled ? key.capsText : key.text);
      String str = text;
      print(text);
    } else if (key.keyType == VirtualKeyboardKeyType.Action) {
      switch (key.action) {
        case VirtualKeyboardKeyAction.Backspace:
          if (text.length == 0) return;
          text = text.substring(0, text.length - 1);
          break;
        case VirtualKeyboardKeyAction.Return:
          text = text + '\n';
          break;
        case VirtualKeyboardKeyAction.Space:
          String tiin;
          List<String> texts = text.split(' ');
          if (check_Tiin(texts[texts.length - 1])) {
            tiin = get_Tiin(texts[texts.length - 1]);
            texts[texts.length - 1] = tiin;
            text = texts.join(" ");
          }
          text = text + key.text;
          break;
        case VirtualKeyboardKeyAction.Shift:
          shiftEnabled = !shiftEnabled;
          break;
        case VirtualKeyboardKeyAction.Language:
          setState(() {
            isNumericMode = !isNumericMode;
          });

          break;
        case VirtualKeyboardKeyAction.Num:
          setState(() {
            isNumericMode = !isNumericMode;
          });
          break;
        case VirtualKeyboardKeyAction.Mon:
          setState(() {
            isMongol = !isMongol;
          });
          break;
        case VirtualKeyboardKeyAction.Arrow:
          setState(() {
            isMongol = !isMongol;
            bigger=!bigger;
          });
          break;
        default:
      }
    }
    // Update the screen
    setState(() {});
  }
}
// #docregion AnimatedLogo
//class AnimatedLogo extends AnimatedWidget {
//  static final opacityTween= Tween<double>(begin: 0.1,end: 1);
//  static final tween  = Tween<double>(begin: 0,end: 400);
//  AnimatedLogo({Key key, Animation<double> animation})
//      : super(key: key, listenable: animation);
//
//  Widget build(BuildContext context) {
//   final animation = listenable as Animation<double>;
//    return Center(
//      child:Opacity(
//        opacity: opacityTween.evaluate(animation),
//        child:Container(
//          margin: EdgeInsets.symmetric(vertical: 10),
//          height: tween.evaluate(animation),
//          width:  tween.evaluate(animation),
//          child: FlutterLogo(),
//        ),
//      )
//    );
//  }
//}