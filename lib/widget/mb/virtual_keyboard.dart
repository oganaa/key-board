import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:keyboard/type.dart';
import 'package:mongol/mongol.dart';

import 'virtual_key.dart';
import 'vkey_action.dart';
import 'vkey_type.dart';

const double _virtualKeyboardDefaultHeight = 300;
const int _virtualKeyboardBackspaceEventPerioud = 250;

/// Keys for Virtual Keyboard's rows.
const List<List> _keyRows = [
  const ['ᠼ', 'ᠤ', 'ᠵ', 'ᠡ', 'ᠨ', 'ᠭ', 'ᠱ', 'ᠦ', 'ᠽ'], // Row 3
  const [
    'ᠶ',
    'ᠪ',
    'ᠥ',
    'ᠠ',
    'ᠬ',
    'ᠷ',
    'ᠣ',
    'ᠯ',
    'ᠳ',
  ], // Row 4
  const ['ᠴ', 'ᠰ', 'ᠮ', 'ᠢ', 'ᠲ', 'ᠸ'], // Row 5
  const [],
];

const List<List> _monKey = [
  const [
    'ᠹ',
    'ᠼ',
    'ᠿ',
    'ᠽ',
    'ᠺ',
    'ᠧ',
    '',
  ], // Row 3
  const [
    '᠎ᠠ',
    '᠎ᠡ',
    'ᡂ',
    'ᠾ',
    'ᡀ',
    'ᠫ',
    '',
  ], // Row 4
  const [
    'ᡁ',
    '',
    '',
  ], // Row 5
  const []
];

List<VirtualKeyboardKey> _getMonKeys(rowNum) {
  // Generate VirtualKeyboardKey objects for each row.
  return List.generate(_monKey[rowNum].length, (int keyNum) {
    // Get key string value.
    String key = _monKey[rowNum][keyNum];

    // Create and return new VirtualKeyboardKey object.
    return VirtualKeyboardKey(
      text: key,
      capsText: key.toUpperCase(),
      keyType: VirtualKeyboardKeyType.String,
    );
  });
}

List<List<VirtualKeyboardKey>> _getMonsRows() {
  // Generate lists for each keyboard row.
  return List.generate(_monKey.length, (int rowNum) {
    // Will contain the keyboard row keys.
    List<VirtualKeyboardKey> rowKeys = [];
    // We have to add Action keys to keyboard.
    switch (rowNum) {
      case 1:
        // String keys.
        rowKeys = _getMonKeys(rowNum);
        // 'Return' button.
        break;
      case 2:
        // String keys.
        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.Arrow),
        );
        rowKeys.addAll(_getMonKeys(rowNum));
        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.Backspace),
        );

        break;
      case 3:
        // String keys.
        rowKeys = _getMonKeys(rowNum);
        // Insert the space key into second position of row.
        // rowKeys.insert(
        //   0,
        //   VirtualKeyboardKey(
        //       keyType: VirtualKeyboardKeyType.Action,
        //       action: VirtualKeyboardKeyAction.Language),
        // );
        // //Sict@028
        // rowKeys.insert(
        //   1,
        //   VirtualKeyboardKey(
        //       keyType: VirtualKeyboardKeyType.Action,
        //       text: ' ',
        //       capsText: ' ',
        //       action: VirtualKeyboardKeyAction.Space),
        // );
        // rowKeys.insert(
        //   2,
        //   VirtualKeyboardKey(
        //       keyType: VirtualKeyboardKeyType.Action,
        //       text: ' ',
        //       capsText: ' ',
        //       action: VirtualKeyboardKeyAction.Space1),
        // );
        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.Language,
              text: ' ',
              capsText: ' '),
        );
/*        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.UpCursor,
              text: '\n',
              capsText: '\n'),
        );*/
        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.Space,
              text: ' ',
              capsText: ' '),
        );
        /*       rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.Space1,
              text: ' ',
              capsText: ' '),
        );*/
/*        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.DownCursor,
              text: '\n',
              capsText: '\n'),
        );*/
        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.Return,
              text: '\n',
              capsText: '\n'),
        );
        break;
      default:
        rowKeys = _getMonKeys(rowNum);
    }
    return rowKeys;
  });
}

/// Keys for Virtual Keyboard's rows.
const List<List> _keyRowsNumeric = [
  // Row 1
  const [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '0',
  ], // Row 1
  const ['@', '#', '%', '^', '&', '*', '(', ')', '!', '/'], // Row 1
  const [
    '*',
    '"',
    ';',
    ':',
    '?',
    '.',
    ',',
  ],
  const [
    '',
    '',
  ],
];

/// Returns a list of `VirtualKeyboardKey` objects for Numeric keyboard.
List<VirtualKeyboardKey> _getKeyboardRowKeysNumeric(rowNum) {
  // Generate VirtualKeyboardKey objects for each row.
  return List.generate(_keyRowsNumeric[rowNum].length, (int keyNum) {
    // Get key string value.
    String key = _keyRowsNumeric[rowNum][keyNum];
    // Create and return new VirtualKeyboardKey object.
    return VirtualKeyboardKey(
      text: key,
      capsText: key.toUpperCase(),
      keyType: VirtualKeyboardKeyType.String,
    );
  });
}

/// Returns a list of `VirtualKeyboardKey` objects.
List<VirtualKeyboardKey> _getKeyboardRowKeys(rowNum) {
  // Generate VirtualKeyboardKey objects for each row.
  return List.generate(_keyRows[rowNum].length, (int keyNum) {
    // Get key string value.
    String key = _keyRows[rowNum][keyNum];
    // Create and return new VirtualKeyboardKey object.
    return VirtualKeyboardKey(
      text: key,
      capsText: key.toUpperCase(),
      keyType: VirtualKeyboardKeyType.String,
    );
  });
}

/// Returns a list of VirtualKeyboard rows with `VirtualKeyboardKey` objects.
List<List<VirtualKeyboardKey>> _getKeyboardRows() {
  // Generate lists for each keyboard row.
  return List.generate(_keyRows.length, (int rowNum) {
    // Will contain the keyboard row keys.
    List<VirtualKeyboardKey> rowKeys = [];

    // We have to add Action keys to keyboard.
    switch (rowNum) {
      case 1:
        // String keys.
        rowKeys = _getKeyboardRowKeys(rowNum);
        // 'Return' button.
        break;
      case 2:
        // String keys.
        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.Mon),
        );
        rowKeys.addAll(_getKeyboardRowKeys(rowNum));
        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.Backspace),
        );
        break;
      case 3:
        // String keys.
        // String keys.
        rowKeys = _getKeyboardRowKeys(rowNum);
        // Insert the space key into second position of row.
        rowKeys.insert(
          0,
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.Language),
        );
        // rowKeys.insert(
        //   1,
        //   VirtualKeyboardKey(
        //       keyType: VirtualKeyboardKeyType.Action,
        //       text: ' ',
        //       capsText: ' ',
        //       action: VirtualKeyboardKeyAction.Space),
        // );
        // rowKeys.insert(
        //   2,
        //   VirtualKeyboardKey(
        //       keyType: VirtualKeyboardKeyType.Action,
        //       text: ' ',
        //       capsText: ' ',
        //       action: VirtualKeyboardKeyAction.Space1),
        // );
/*        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.UpCursor,
              text: '\n',
              capsText: '\n'),
        );*/
        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.Space,
              text: ' ',
              capsText: ' '),
        );
/*        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.Space1,
              text: ' ',
              capsText: ' '),
        );*/
/*        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.DownCursor,
              text: '\n',
              capsText: '\n'),
        );*/
        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.Return,
              text: '\n',
              capsText: '\n'),
        );
        break;
      default:
        rowKeys = _getKeyboardRowKeys(rowNum);
    }
    return rowKeys;
  });
}

/// Returns a list of VirtualKeyboard rows with `VirtualKeyboardKey` objects.
List<List<VirtualKeyboardKey>> _getKeyboardRowsNumeric() {
  // Generate lists for each keyboard row.
  return List.generate(_keyRowsNumeric.length, (int rowNum) {
    // Will contain the keyboard row keys.
    List<VirtualKeyboardKey> rowKeys = [];
    // We have to add Action keys to keyboard.
    switch (rowNum) {
      case 1:
        // String keys.
        rowKeys = _getKeyboardRowKeysNumeric(rowNum);
        // 'Return' button.
        break;
      case 2:
        // String keys.
        rowKeys.addAll(_getKeyboardRowKeysNumeric(rowNum));
        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.Backspace),
        );
        break;
      case 3:
        // String keys.
        rowKeys = _getKeyboardRowKeys(rowNum);
        // Insert the space key into second position of row.
        rowKeys.insert(
          0,
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.Num),
        );
        // rowKeys.insert(
        //   1,
        //   VirtualKeyboardKey(
        //       keyType: VirtualKeyboardKeyType.Action,
        //       text: ' ',
        //       capsText: ' ',
        //       action: VirtualKeyboardKeyAction.Space),
        // );
        // rowKeys.insert(
        //   2,
        //   VirtualKeyboardKey(
        //       keyType: VirtualKeyboardKeyType.Action,
        //       text: ' ',
        //       capsText: ' ',
        //       action: VirtualKeyboardKeyAction.Space1),
        // );
/*        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.UpCursor,
              text: '\n',
              capsText: '\n'),
        );*/
        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.Space,
              text: ' ',
              capsText: ' '),
        );
/*        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.Space1,
              text: ' ',
              capsText: ' '),
        );*/
/*        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.DownCursor,
              text: '\n',
              capsText: '\n'),
        );*/
        rowKeys.add(
          VirtualKeyboardKey(
              keyType: VirtualKeyboardKeyType.Action,
              action: VirtualKeyboardKeyAction.Return,
              text: '\n',
              capsText: '\n'),
        );
        break;
      default:
        rowKeys = _getKeyboardRowKeysNumeric(rowNum);
    }
    return rowKeys;
  });
}

/// Virtual Keyboard widget.
class VirtualKeyboard extends StatefulWidget {
  /// Keyboard Type: Should be inited in creation time.
  final VirtualKeyboardType type;
  final bool mon;

  /// Callback for Key press event. Called with pressed `Key` object.
  final Function onKeyPress;
  final Function onLongKeyPress;

  /// Virtual keyboard height. Default is 300
  final double height;

  /// Color for key texts and icons.
  //final Color textColor;

  /// Font size for keyboard keys.
  // final double fontSize;

  /// The builder function will be called for each Key object.
  final Widget Function(BuildContext context, VirtualKeyboardKey key) builder;

  /// Set to true if you want only to show Caps letters.
  final bool alwaysCaps;

  VirtualKeyboard(
      {Key key,
      @required this.type,
      @required this.onKeyPress,
      @required this.onLongKeyPress,
      @required this.mon,
      this.builder,
      this.height =
          _virtualKeyboardDefaultHeight, // this.textColor = Colors.black,
      // this.fontSize = 14,
      this.alwaysCaps = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VirtualKeyboardState();
  }
}

/// Holds the state for Virtual Keyboard class.
class _VirtualKeyboardState extends State<VirtualKeyboard> {
  bool changeIcon;
  VirtualKeyboardType type;
  VirtualKeyboardType type1;
  Function onKeyPress;
  Function onLongKeyPress;
  // The builder function will be called for each Key object.
  Widget Function(BuildContext context, VirtualKeyboardKey key) builder;
  double height;

  // Color textColor;
  // double fontSize;
  bool alwaysCaps;

  // Text Style for keys.
  TextStyle textStyle;
  // True if shift is enabled.
  bool isShiftEnabled = false;
  bool mon;
  bool animate = false;
  bool popup;
  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      mon = widget.mon;
      type = widget.type;
      onKeyPress = widget.onKeyPress;
      height = widget.height;
      onLongKeyPress = widget.onLongKeyPress;
      // textColor = widget.textColor;
      //  fontSize = widget.fontSize;
      alwaysCaps = widget.alwaysCaps;

      // Init the Text Style for keys.
      /* textStyle = TextStyle(
       fontSize: fontSize,
        color: textColor,
      );*/
    });
  }

  @override
  void initState() {
    super.initState();
    type = widget.type;
    onKeyPress = widget.onKeyPress;
    height = widget.height;
    onLongKeyPress = widget.onLongKeyPress;
    // textColor = widget.textColor;
    //  fontSize = widget.fontSize;
    alwaysCaps = widget.alwaysCaps;
    mon = widget.mon;
    popup = true;
    // Init the Text Style for keys.
    /* textStyle = TextStyle(
      fontSize: fontSize,
      color: textColor,
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return type == VirtualKeyboardType.Numeric
        ? _numeric()
        : (type == VirtualKeyboardType.Alphanumeric
            ? _alphanumeric()
            : _monkeys());
  }

  Widget _alphanumeric() {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _rows(),
      ),
    );
  }

  Widget _numeric() {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _rows(),
      ),
    );
  }

  Widget _monkeys() {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _rows(),
      ),
    );
  }

  /// Returns the rows for keyboard.
  List<Widget> _rows() {
    // Get the keyboard Rows
    List<List<VirtualKeyboardKey>> keyboardRows =
        type == VirtualKeyboardType.Numeric
            ? _getKeyboardRowsNumeric()
            : (type == VirtualKeyboardType.Alphanumeric
                ? _getKeyboardRows()
                : _getMonsRows());

    // Generate keyboard row.
    List<Widget> rows = List.generate(keyboardRows.length, (int rowNum) {
      return Material(
        color: Colors.transparent,
        child: GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                keyboardRows[rowNum].length,
                (int keyNum) {
                  // Get the VirtualKeyboardKey object.
                  VirtualKeyboardKey virtualKeyboardKey =
                      keyboardRows[rowNum][keyNum];
                  Widget keyWidget;

                  // Check if builder is specified.
                  // Call builder function if specified or use default
                  //  Key widgets if not.
                  if (builder == null) {
                    // Check the key type.
                    switch (virtualKeyboardKey.keyType) {
                      case VirtualKeyboardKeyType.String:
                        // Draw String key.
                        keyWidget = _keyboardDefaultKey(
                            virtualKeyboardKey, keyboardRows, rowNum, keyNum);
                        break;
                      case VirtualKeyboardKeyType.Action:
                        // Draw action key.
                        keyWidget = _keyboardDefaultActionKey(
                            virtualKeyboardKey, keyboardRows, rowNum, keyNum);
                        break;
                    }
                  } else {
                    // Call the builder function, so the user can specify custom UI for keys.
                    keyWidget = builder(context, virtualKeyboardKey);

                    if (keyWidget == null) {
                      throw 'builder function must return Widget';
                    }
                  }

                  return keyWidget;
                },
              ),
            )),
      );
    });

    return rows;
  }

  // True if long press is enabled.
  bool longPress;

  String monToCyr(String str) {
    // эгнээ 1
    if (str == 'ᠥ') return 'ө';
    if (str == 'ᠶ') return 'й';
    if (str == 'ᠷ') return 'р';
    if (str == 'ᠸ') return 'в';
    if (str == 'ᠡ') return 'э';
    if (str == 'ᠲ') return 'т';
    if (str == 'ᠤ') return 'у';
    if (str == 'ᠢ') return 'и';
    if (str == 'ᠣ') return 'о';
    if (str == 'ᠫ') return 'п';
    if (str == 'ᠺ') return 'к';
    // эгнээ 2
    if (str == 'ᠠ') return 'а';
    if (str == 'ᠰ') return 'с';
    if (str == 'ᠳ') return 'д';
    if (str == 'ᠹ') return 'ф';
    if (str == 'ᠭ') return 'г';
    if (str == 'ᠬ') return 'х';
    if (str == 'ᠵ') return 'ж,з';
    if (str == 'ᠺ') return 'к';
    if (str == 'ᠯ') return 'л';
    if (str == 'ᠧ') return 'е';
    if (str == 'ᢉ') return 'гэ/хэ';

    // эгнээ 3
    if (str == 'ᠽ') return 'з';
    if (str == 'ᠱ') return 'ш';
    if (str == 'ᠴ') return 'ц,ч';
    if (str == 'ᠦ') return 'ү';
    if (str == 'ᠪ') return 'б';
    if (str == 'ᠨ') return 'н\nнг';
    if (str == 'ᠮ') return 'м';
    if (str == '᠂') return ',';
    // key 2
    if (str == '᠎ᠠ') return 'а';
    if (str == '᠎ᠡ') return 'э';
    if (str == 'ᠿ') return 'ж';
    if (str == 'ᠩ') return 'нг';
    if (str == 'ᡀ') return 'лх';
    if (str == 'ᠾ') return 'х';
    if (str == 'ᠼ') return 'ц';
    if (str == 'ᡁ') return 'зи';
    if (str == 'ᡂ')
      return 'ци';
    else
      return '';
  }

  bool toDawharTemdegt(String str) {
    if (str == 'ᠨ') {
      return true;
    } else if (str == 'ᠠ') {
      return true;
    } else if (str == 'ᠡ') {
      return true;
    }
    return false;
  }

  String toConvert(String str) {
    if (str == 'ᠨ') {
      return 'ᠨ ᠩ';
    } else if (str == 'ᠠ') {
      return 'ᠠ ᠎ᠠ';
    } else if (str == 'ᠡ') {
      return 'ᠡ ᠎ᠡ';
    }
    return '';
  }

  /// Creates default UI element for keyboard Key.
  Widget _keyboardDefaultKey(VirtualKeyboardKey key,
      List<List<VirtualKeyboardKey>> keyboardRows, int rowNum, int rowKeyNum) {
    bool result = false;
    bool ontab;
    return Expanded(
        child: GestureDetector(
      onHorizontalDragUpdate: (updateDetails) {
        onKeyPress(key, keyboardRows, rowNum, rowKeyNum, false);
      },
      onVerticalDragUpdate: (updateDetails) {
        onKeyPress(key, keyboardRows, rowNum, rowKeyNum, false);
      },
      onLongPressStart: (_) {
        ontab = true;
        result = true;
        onLongKeyPress(key, keyboardRows, rowNum, rowKeyNum, result);
      },
      onLongPressEnd: (_) {
        ontab = true;
        result = false;
        onLongKeyPress(key, keyboardRows, rowNum, rowKeyNum, result);
      },
      onTapUp: (_) {
        result = false;
        setState(() {
          onKeyPress(key, keyboardRows, rowNum, rowKeyNum, result);
        });
      },
      onTapDown: (_) {
        result = true;
        onKeyPress(key, keyboardRows, rowNum, rowKeyNum, result);
      },
      child: Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey[300]),
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        height: height / _keyRows.length - 10,
        child: toDawharTemdegt(key.text)
            ? Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 7,
                    child: MongolText(
                      toConvert(key.text),
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 16,
                          fontFamily: "MongolianScript",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Text(monToCyr(key.text),
                        style:
                            TextStyle(color: Colors.grey[400], fontSize: 14)),
                  ),
                ],
              )
            : Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      alwaysCaps
                          ? key.capsText
                          : (isShiftEnabled
                              ? key.capsText
                              : monToCyr(key.text).toString()),
                      style: TextStyle(color: Colors.grey[400], fontSize: 15),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 5),
                    child: mon
                        ? MongolText(
                            key.text,
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontFamily: "MongolianScript",
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          )
                        : Text(
                            key.text,
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ],
              ),
      ),
    ));
  }

  /// Creates default UI element for keyboard Action Key.
  Widget _keyboardDefaultActionKey(VirtualKeyboardKey key,
      List<List<VirtualKeyboardKey>> keyboardRows, int rowNum, int rowKeyNum) {
    animate = !animate;
    // Holds the action key widget.
    bool shift = false;
    Widget actionKey;
    // Switch the action type to build action Key widget.
    switch (key.action) {
      case VirtualKeyboardKeyAction.UpCursor:
        actionKey = Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(top: 3, bottom: 3, right: 3, left: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Center(
            child: (Icon(Icons.arrow_upward)),
            //child: Text('\uD83C\uDDF2\uD83C\uDDF3'),
          ),
        );
        break;
      case VirtualKeyboardKeyAction.DownCursor:
        actionKey = Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(top: 3, bottom: 3, right: 3, left: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Center(
            child: (Icon(Icons.arrow_downward)),
            //child: Text('\uD83C\uDDF2\uD83C\uDDF3'),
          ),
        );
        break;
      case VirtualKeyboardKeyAction.Arrow:
        actionKey = Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(top: 5, bottom: 5, right: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[400],
          ),
          child: Icon(Icons.arrow_upward, color: Colors.black),
        );
        break;
      case VirtualKeyboardKeyAction.Num:
        actionKey = Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(top: 3, bottom: 3, left: 2, right: 4),
          decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: Colors.grey[200]),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Center(
            child: Text('\uD83C\uDDF2\uD83C\uDDF3'),
          ),
          //child: (Icon(Icons.keyboard)),
        );

        break;
      case VirtualKeyboardKeyAction.Language:
        {
          actionKey = Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.only(top: 3, bottom: 3, right: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 3, color: Colors.grey[200]),
              color: Colors.white,
            ),
            child: Center(
              child: (Icon(Icons.keyboard)),
              //child: Text('\uD83C\uDDF2\uD83C\uDDF3'),
            ),
          );
        }
        break;
      case VirtualKeyboardKeyAction.Mon:
        actionKey = Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(top: 5, bottom: 5, right: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[300],
          ),
          child: Icon(Icons.arrow_upward, color: Colors.black),
        );
        break;
      case VirtualKeyboardKeyAction.Backspace:
        actionKey = GestureDetector(
          onLongPress: () {
            longPress = true;
            // Start sending backspace key events while longPress is true
            Timer.periodic(
                Duration(milliseconds: _virtualKeyboardBackspaceEventPerioud),
                (timer) {
              if (longPress) {
                onKeyPress(key, keyboardRows, rowNum, rowKeyNum, false);
              } else {
                // Cancel timer.
                timer.cancel();
              }
            });
          },
          onLongPressUp: () {
            // Cancel event loop
            longPress = false;
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.only(top: 5, bottom: 5, right: 3, left: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[400],
            ),
            child: Icon(Icons.backspace, color: Colors.black),
          ),
        );
        break;
      case VirtualKeyboardKeyAction.Shift:
        actionKey = Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(top: 3, bottom: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Icon(Icons.arrow_upward, color: Colors.black),
        );
        break;
      case VirtualKeyboardKeyAction.Space:
        actionKey = Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(top: 3, bottom: 3, right: 3),
          decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: Colors.grey[200]),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white,
          ),
          child: Container(height: 20, child: Icon(Icons.space_bar)),
        );
        break;
/*      case VirtualKeyboardKeyAction.Space1:
        actionKey = Stack(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: double.infinity,
                margin: EdgeInsets.only(top: 3, bottom: 3, right: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  color: Colors.white,
                ),
                child: Container(
                  padding: EdgeInsets.only(bottom: 0.1),
                  height: 20,
                  child: Image.asset(
                    "assets/images/right.jpg",
                  ),
                )),
          ],
        );
        break;*/
      case VirtualKeyboardKeyAction.Return:
        actionKey = Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.only(top: 3, bottom: 3, right: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 2.5, color: Colors.grey[200]),
            color: Colors.white,
          ),
          child: Icon(
            Icons.keyboard_return,
            color: Colors.black,
          ),
        );
        break;
    }
    return Expanded(
      child: InkWell(
        onTap: () {
          if (key.action == VirtualKeyboardKeyAction.Shift) {
            if (!alwaysCaps) {
              setState(() {
                isShiftEnabled = !isShiftEnabled;
              });
            }
          }
          onKeyPress(key, keyboardRows, rowNum, rowKeyNum, false);
        },
        child: Container(
          alignment: Alignment.center,
          height: height / _keyRows.length,
          child: actionKey,
        ),
      ),
    );
  }
}
