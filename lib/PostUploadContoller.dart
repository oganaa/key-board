import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard/base_controller.dart';
import 'package:keyboard/utils/mb_tungaamal.dart';
import 'package:mongol/mongol.dart';

import 'key.dart';
import 'key_action.dart';
import 'key_type.dart';

class PostUploadCtrl extends BaseController {

  List<bool> selectKeyboard = [true, false, false, false];
  TextEditingController textController = new TextEditingController();
  TextEditingController galigController = new TextEditingController();
  Tungaamal tungaamal = new Tungaamal();
  String txtGalig = "";
  String txtMongol = "";
  String tunMongolText = "";
  Widget action1;
  bool clear = false;
  bool bigger = false;
  double width = 750;
  double height = 1334;

  ///start image cropper ///
  Uint8List decodedImage;
  bool _inProcess = false;
  File selectedCroppedImageFile;
  String imageSelectPerson = '';

  //List<dynamic> images = [];
  String _error = 'No Error Dectected';

  ///end image cropper ///
  bool zipCheck = false;
  bool publicCheck = true;
  bool friendsCheck = false;
  bool onlyMeCheck = false;

  bool vkey_bigger = false;

  // True if shift enabled.
  bool vkey_shiftEnabled = false;
  bool vkey_isNumericMode = false;
  bool vkey_isMongol = true;

  //------------------ Feed POST drawing
  double sketchHeight = 1119; //1119

  double contextWidth = 0;
  Color newColor = Colors.white;
  double rowHeight = 0;
  int curRow = 0;
  int indexWord = 0;
  int oneColumnLength = 1;
  int allColumnLength = 1;
  bool rightPosiotion;
  List<String> databaseFindWords = [];
  List<Map<String, dynamic>> autoWords = [];
  List<String> tiinYalgal = [
    // hariyalah tiin yalgal
    '\u202F\u1836\u1822\u1828', //йин
    '\u202F\u1826', // у ү
    '\u202F\u1826\u1828', // ун үн
    // zaahiin tiin yalgal
    '\u202F\u1822', // i
    '\u202F\u1836\u1822', // ii
    // uguh orshih
    '\u202F\u1833\u1826', //du
    '\u202F\u1833\u1826\u1837', //dur
    '\u202F\u1832\u1826', //tu
    '\u202F\u1832\u1826\u1837', //tur
    // garahiin tiin yalgal
    '\u202F\u1820\u1834\u1820', // acha eche
    // uildeh
    '\u202F\u182A\u1820\u1837', // bar ber
    '\u202F\u1822\u1836\u1821\u1837', //iyar
    // хамтрах
    'ᠲᠠᠢ', //tai
    //chigleh
    'ᠯᠤᠭ᠎ᠠ', //луга
    '\u202Fᠯᠦᢉᠡ', // лүгэ
    // olon too
    '\u202F\u1824\u1833', // ud vd
    'ᠨᠤᠭᠤᠳ', //нугуд
    '\u202F\u1828\u1826\u1889\u1826\u1833', //нүгүд
    '\u202F\u1822\u1836\u1821\u1828', //iian
    '\u202F\u182A\u1820\u1828', //ban
  ];

  // text controller
  TextEditingController mongolTextcontroller;
  FocusNode myFocusNode = new FocusNode();
  ScrollController scroll = new ScrollController();
  String mongolianInputText = '';
  List<String> listViewTiinText = [];
  List<String> dataWordLenght = [];
  bool isLooktuntxt = false;
  bool databaseWordsSee = true;
  List<Map<String, dynamic>> dbPeople = [];
  List<Map<String, dynamic>> taggedPeople = [];
  List<Map<String, dynamic>> searchPeople = [];
  List<Map<String, dynamic>> storyPages = [];
  List<dynamic> storyElements = [];
  List<String> storyPositions = [];
  String activeTab = 'text';
  String activeAction = 'off';
  int activeStory = -1;
  List<dynamic> milestones = [];
  int selected_Mile_ind = 0;
  TextEditingController searchController;
  String textHint1 = 'Та юу бодож байна ?';
  String textHint2 = 'Та юу бодож байна ?';
  String windowTitle = 'Нийтлэл бичих';
  int activeAlbum = 0;
  int activePageImage = 0;
  List<String> albumLayouts = [];
  TextEditingController albumTextcontroller;
  double total_file_size = 0;

  BuildContext context;

  void initialise(BuildContext _context) async {
    context = _context;

    rightPosiotion = true;
    textController.addListener(textListener);
    galigController.addListener(galigListener);
    mongolTextcontroller = TextEditingController(text: '');
    tunMongolText = tungaamal.tun2tun(mongolTextcontroller.text);

    searchController = TextEditingController(text: '');
    storyPositions.add('Зүүн дээр');
    storyPositions.add('Дээр');
    storyPositions.add('Баруун дээр');
    storyPositions.add('Зүүн дунд');
    storyPositions.add('Дунд');
    storyPositions.add('Баруун дунд');
    storyPositions.add('Зүүн доор');
    storyPositions.add('Доор');
    storyPositions.add('Баруун доор');

    zipCheck = false;
    publicCheck = false;
    friendsCheck = false;
    onlyMeCheck = false;
  }

  void changeTab(String newtab) {
    activeTab = newtab;
    notifyListeners();
  }

  void changeLeftRight() {
    rightPosiotion = !rightPosiotion;
    notifyListeners();
  }

  /*
  *     MILESTONE
  * */
  void setActiveMile(int ind) {
    selected_Mile_ind = ind;
    notifyListeners();
  }

  /*
  *    STORY
  */

  Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  void storyActivate(int ind) {
    activeStory = ind;
    if (ind > 0) {
      activeAction = 'off';
    }
    notifyListeners();
  }

  void storySet_Element(String action) {
    if (action == activeAction)
      activeAction = 'off';
    else
      activeAction = action;
    notifyListeners();
  }

  /*

  ALBUM create & edit

  */

  textListener() {
    if (selectKeyboard[0]) {
      /*if( selectKeyboard[1] ) {
        print("Galig = ${txtGalig}");
        txtGalig = textController.text;
      }
      txtMongol = tungaamal.cyr2Tun(txtGalig);
      print("convertod Mongol = ${txtMongol}"); */
      notifyListeners();
    }
    //return textController.text;
  }

  galigListener() {
    if (selectKeyboard[1]) {
      print("Galig = ${txtGalig}");
      txtGalig = galigController.text;
    }
    txtMongol = tungaamal.cyr2Tun(txtGalig);
    mongolTextcontroller.text = txtMongol;
    print("convertod Mongol = ${txtMongol}");

    // if(curUser.post_upload_purpose==0) {
    //   textController.text = txtGalig;
    // }

    notifyListeners();

    //return textController.text;
  }

  void JumpToViewTypeView() {
    // _navigationService.navigateTo(ViewTypeViewRoute);
  }

  void ZipCheckValueChange() {
    zipCheck = !zipCheck;
    print('changed zipCheck check ==> ${zipCheck}');
    if (zipCheck) {
      publicCheck = false;
      friendsCheck = false;
      onlyMeCheck = false;
      notifyListeners();
    }
    notifyListeners();
  }

  void publicCheckValueChange() {
    publicCheck = !publicCheck;
    // curUser.post_upload_scopeid = 3;
    print('changed Public check ==> ${publicCheck}');
    if (publicCheck) {
      friendsCheck = false;
      onlyMeCheck = false;
      zipCheck = false;
      notifyListeners();
    }
    notifyListeners();
  }

  void friendsCheckValueChange() {
    friendsCheck = !friendsCheck;
    // curUser.post_upload_scopeid = 2;
    print('changed friendsCheck check ==> ${friendsCheck}');
    if (friendsCheck) {
      publicCheck = false;
      onlyMeCheck = false;
      zipCheck = false;
      notifyListeners();
    }
    notifyListeners();
  }

  void onlyMeCheckValueChange() {
    onlyMeCheck = !onlyMeCheck;
    // curUser.post_upload_scopeid = 1;
    print('changed Onlyme check ==> ${onlyMeCheck}');
    if (onlyMeCheck) {
      publicCheck = false;
      friendsCheck = false;
      zipCheck = false;
      notifyListeners();
    }
    notifyListeners();
  }

  void toggleButtonValueChange(int index, BuildContext context) {
    for (int indexBtn = 0; indexBtn < selectKeyboard.length; indexBtn++) {
      if (indexBtn == index) {
        selectKeyboard[indexBtn] = true;
      } else {
        selectKeyboard[indexBtn] = false;
      }
    }
    if (selectKeyboard[0] || selectKeyboard[1]) {
      SystemChannels.textInput.invokeMethod('TextInput.show');
    }
    if (selectKeyboard[2])
      SystemChannels.textInput.invokeMethod('TextInput.hide');

    // CURSOR to END
    if (selectKeyboard[0] || selectKeyboard[1]) {
      String savetext = "";
      String cyrylictext = "";
      String tungaamaltext = "";
      isLooktuntxt = false;
      databaseWordsSee = false;
/*          List<String> res = [];
          print("len = "+mongolText.length.toString());*/
/*          for(int i = 0 ; i<autoWords.length;i++){
            if(autoWords[i]['tuntxt']==mongolTextcontroller.text){
              savetext = (autoWords[i]['cyrtxt']);
              isLooktuntxt = true;
              break;
            }
          }
          if(isLooktuntxt){
            textController.text =savetext;
            txtMongol = mongolTextcontroller.text;
          }
          else {
            textController.text = tungaamal.tun2cyr(mongolTextcontroller.text);
            txtMongol = mongolTextcontroller.text;
            isLooktuntxt = false;
          }*/
      txtMongol = tungaamal.tun2tun(mongolTextcontroller.text);
      //textController.text = tungaamal.tun2cyr(txtMongol);
      galigController.text = tungaamal.tun2cyr(txtMongol);
/*          for(int r = 0;r<mongolText.length; r++){
            for(int i = 0 ; i<autoWords.length;i++){
              if(autoWords[i]['tuntxt']==mongolText[r]){
                savetext = (autoWords[i]['cyrtxt']);
                cyrylictext += savetext+' ';
                tungaamaltext += mongolText[r]+' ';
                isLooktuntxt = true;
                i = autoWords.length;
              }
            }
            if(isLooktuntxt){
              cyrylictext += savetext+' ';
              tungaamaltext += mongolText[r]+' ';
            }
            else {
              cyrylictext += tungaamal.tun2cyr( mongolText[r])+' ';
              tungaamaltext += mongolText[r]+' ';
              isLooktuntxt = false;
            }
          }*/
      // textController.text = cyrylictext.substring(0,cyrylictext.length-1);
      // txtMongol = tungaamaltext;
/*          int cur_pos = txtMongol.indexOf('|');
          txtMongol=txtMongol.replaceAll('|', '');
          textController.text = txtGalig.replaceAll('|', '');
          textController.selection = TextSelection.fromPosition( TextPosition(offset: cur_pos) );*/
      //txtGalig = textController.text.replaceAll('|', '');
    } else if (selectKeyboard[2]) {
      tunMongolText = txtMongol;
      mongolTextcontroller.text = tunMongolText;
      //txtMongol=txtMongol.replaceAll('|', '');
      // txtGalig = textController.text.replaceAll('|', '');
      // print('textController.selection.baseOffset = ${textController.selection.baseOffset}');
      // if(textController.selection.baseOffset == -1)
      //   txtMongol = txtMongol+'|';
      // else txtMongol = txtMongol.substring(0, textController.selection.baseOffset) + '|'+ txtMongol.substring(textController.selection.baseOffset);
      // textController.text = txtGalig;
      // //textController.selection = TextSelection.fromPosition(
//          TextPosition(offset: textController.text.indexOf('|')));
    }
    notifyListeners();
  }

  bool check_Tiin(String word) {
    //харьяалахын тйин ялгал
    if (word.length == 2 &&
        (word.substring(0, 2) == 'ᠦ|' || word.substring(0, 2) == 'ᠤ|')) {
      return true;
    }
    if (word.length == 3 &&
        (word.substring(0, 3) == 'ᠦᠨ|' || word.substring(0, 3) == 'ᠤᠨ|')) {
      return true;
    }
    if (word.length == 4 && (word.substring(0, 4) == 'ᠶᠢᠨ|')) {
      return true;
    }
    //заахын тийн ялгал
    if (word.length == 2 && (word.substring(0, 2) == 'ᠢ|')) {
      return true;
    }
    if (word.length == 3 && (word.substring(0, 3) == 'ᠶᠢ|')) {
      return true;
    }
    //өгөх оршихийн тйин ялгал
    if (word.length == 3 &&
        (word.substring(0, 3) == 'ᠳᠤ|' || word.substring(0, 3) == 'ᠳᠦ|')) {
      return true;
    }
    if (word.length == 4 &&
        (word.substring(0, 4) == 'ᠳᠤᠷ|' || word.substring(0, 4) == 'ᠳᠦᠷ|')) {
      return true;
    }
    if (word.length == 3 &&
        (word.substring(0, 3) == 'ᠲᠤ|' || word.substring(0, 3) == 'ᠲᠦ|')) {
      return true;
    }
    if (word.length == 4 &&
        (word.substring(0, 4) == 'ᠲᠤᠷ|' || word.substring(0, 4) == 'ᠲᠦᠷ|')) {
      return true;
    }
    //гарахын тийн ялгал
    if (word.length == 4 &&
        (word.substring(0, 4) == 'ᠠᠴᠠ|' || word.substring(0, 4) == 'ᠡᠴᠡ|')) {
      return true;
    }
    //үйлдэхийн тийн ялгал
    if (word.length == 4 &&
        (word.substring(0, 4) == 'ᠪᠠᠷ|' || word.substring(0, 4) == 'ᠪᠡᠷ|')) {
      return true;
    }
    if (word.length == 5 &&
        (word.substring(0, 5) == 'ᠢᠶᠠᠷ|' || word.substring(0, 5) == 'ᠢᠶᠡᠷ|')) {
      return true;
    }
    // olon too
    if (word.length == 3 &&
        (word.substring(0, 3) == 'ᠤᠳ|' || word.substring(0, 3) == 'ᠦᠳ|')) {
      return true;
    }
    return false;
  }

  String get_Tiin(String word) {
    //харьяалахын тйин ялгал
    if (word.length == 2 &&
        (word.substring(0, 2) == 'ᠦ|' || word.substring(0, 2) == 'ᠤ|')) {
      return '\u202F\u1826|';
    }
    if (word.length == 3 &&
        (word.substring(0, 3) == 'ᠦᠨ|' || word.substring(0, 3) == 'ᠤᠨ|')) {
      return '\u202F\u1826\u1828|';
    }
    if (word.length == 4 && (word.substring(0, 4) == 'ᠶᠢᠨ|')) {
      return '\u202F\u1836\u1822\u1828|';
    }
    //заахын тийн ялгал
    if (word.length == 2 && (word.substring(0, 2) == 'ᠢ|')) {
      return '\u202F\u1822|';
    }
    if (word.length == 3 && (word.substring(0, 3) == 'ᠶᠢ|')) {
      return '\u202F\u1836\u1822|';
    }
    //өгөх оршихийн тйин ялгал
    if (word.length == 3 &&
        (word.substring(0, 3) == 'ᠳᠤ|' || word.substring(0, 3) == 'ᠳᠦ|')) {
      return '\u202F\u1833\u1826|';
    }
    if (word.length == 4 &&
        (word.substring(0, 4) == 'ᠳᠤᠷ|' || word.substring(0, 4) == 'ᠳᠦᠷ|')) {
      return '\u202F\u1833\u1826\u1837|';
    }
    if (word.length == 3 &&
        (word.substring(0, 3) == 'ᠲᠤ|' || word.substring(0, 3) == 'ᠲᠦ|')) {
      return '\u202F\u1832\u1826|';
    }
    if (word.length == 4 &&
        (word.substring(0, 4) == 'ᠲᠤᠷ|' || word.substring(0, 4) == 'ᠲᠦᠷ|')) {
      return '\u202F\u1832\u1826\u1837|';
    }
    //гарахын тийн ялгал
    if (word.length == 4 &&
        (word.substring(0, 4) == 'ᠠᠴᠠ|' || word.substring(0, 4) == 'ᠡᠴᠡ|')) {
      return '\u202F\u1820\u1834\u1820|';
    }
    //үйлдэхийн тийн ялгал
    if (word.length == 4 &&
        (word.substring(0, 4) == 'ᠪᠠᠷ|' || word.substring(0, 4) == 'ᠪᠡᠷ|')) {
      return '\u202F\u182A\u1820\u1837|';
    }
    if (word.length == 5 &&
        (word.substring(0, 5) == 'ᠢᠶᠠᠷ|' || word.substring(0, 5) == 'ᠢᠶᠡᠷ|')) {
      return '\u202F\u1822\u1836\u1821\u1837|';
    }
    // olon too
    if (word.length == 3 &&
        (word.substring(0, 3) == 'ᠤᠳ|' || word.substring(0, 3) == 'ᠦᠳ|')) {
      return '\u202F\u1824\u1833|';
    }
    return '';
  }

  String toDawharTemdegt(String str) {
    if (str == 'ᠨ') {
      return 'ᠩ';
    } else if (str == 'ᠠ') {
      return '᠎ᠠ';
    } else if (str == 'ᠡ') {
      return '᠎ᠡ';
    }
    return str;
  }

  // ignore: missing_return
  List<String> getListViewTiin(String text) {
    List<String> res = [];
    if (text == '\u1836') {
      res.add('\u202F\u1836\u1822\u1828');
      res.add('\u202F\u1836\u1822');
      return res;
    }
    else if (text == 'ᠤ' || text == 'ᠦ') {
      res.add('\u202F\u1826');
      res.add('\u202F\u1826\u1828');
      res.add('\u202F\u1824\u1833');
    }
    else if (text == 'ᠢ') {
      res.add('\u202F\u1822');
      res.add('\u202F\u1822\u1836\u1821\u1837');
      res.add('\u202F\u1822\u1836\u1821\u1828');
    }
    else if (text == 'ᠳ') {
      res.add('\u202F\u1833\u1826');
      res.add('\u202F\u1833\u1826\u1837');
    }

    else if (text == 'ᠲ') {
      res.add('\u202F\u1832\u1826');
      res.add('\u202F\u1832\u1826\u1837');
      res.add('\u202Fᠲᠠᠢ');
    }
    else if (text == 'ᠠ' || text == 'ᠡ') {
      res.add('\u202F\u1820\u1834\u1820');
    }
    else if (text == 'ᠪ') {
      res.add('\u202F\u182A\u1820\u1828');
      res.add('\u202F\u182A\u1820\u1837');
    }
    else if (text == 'ᠯ') {
      res.add('\u202Fᠯᠤᠭ᠎ᠠ');
      res.add('\u202Fᠯᠦᢉᠡ');
    }
    else if (text == 'ᠨ') {
      res.add('\u202Fᠨᠤᠭᠤᠳ');
      res.add('\u202F\u1828\u1826\u1889\u1826\u1833');
    }
    return res;
  }

  // text editor  function
  void insertText(String mongolianInputText) {
    String text = mongolTextcontroller.text;
    TextSelection textSelection = mongolTextcontroller.selection;
    String newText = text.replaceRange(
        textSelection.start, textSelection.end, mongolianInputText);
    final myTextLength = mongolianInputText.length;

    print(mongolTextcontroller.text);
    tunMongolText = tungaamal.tun2tun(newText);

    mongolTextcontroller.text = tunMongolText; //;newText;
    mongolTextcontroller.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void deleteText() {
    String text = mongolTextcontroller.text;
    TextSelection textSelection = mongolTextcontroller.selection;
    final selectionLength = textSelection.end - textSelection.start;

    // There is a selection.
    if (selectionLength > 0) {
      String newText =
      text.replaceRange(textSelection.start, textSelection.end, '');
      mongolTextcontroller.text = newText;
      mongolTextcontroller.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    }

    // The cursor is at the beginning.
    if (textSelection.start == 0) {
      return;
    }
    // Delete the previous character
    // TODO: Handle deleting invisible characters like MVS, FVS, etc.
    final newStart = textSelection.start - 1;
    final newEnd = textSelection.start;
    String newText = text.replaceRange(newStart, newEnd, '');
    mongolTextcontroller.text = newText;
    mongolTextcontroller.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  //
  /// Fired when the virtual keyboard key is pressed.
  void onKeyLongPress(VirtualKeyboardKey key,
      List<List<VirtualKeyboardKey>> keyboardRows, int row, int col, bool str) {
    String longPressMglText = '';
    if (key.keyType == VirtualKeyboardKeyType.String) {
      clear = str;
      if (clear) {
        //longPressMglText = 'ᠩ';

        //print(text);
        databaseWordsSee = true;
        // text = textToCursor(text);
        print("Text length = " + mongolTextcontroller.text.length.toString());
        deleteText();
        insertText(toDawharTemdegt(key.text));
      }
    }
    notifyListeners();
  }

  void onKeyPress(VirtualKeyboardKey key,
      List<List<VirtualKeyboardKey>> keyboardRows, int row, int col, bool str) {
    if (key.keyType == VirtualKeyboardKeyType.String) {
      clear = str;
      // print(clear);
      // print("str=${col} $row");
      // print(width);
      if (clear) {
        insertText(key.text);
        databaseWordsSee = true;
        listViewTiinText = [];
        if (mongolTextcontroller.text.length <= 1) {
          listViewTiinText = getListViewTiin(key.text);
        }
        else
        if (mongolTextcontroller.text[mongolTextcontroller.text.length - 2] ==
            '\n' ||
            mongolTextcontroller.text[mongolTextcontroller.text.length - 2] ==
                ' ' &&
                mongolTextcontroller.text[mongolTextcontroller.text.length -
                    1] == key.text) {
          listViewTiinText = getListViewTiin(key.text);
        }
        // ugugdliin san
        List<String> databaseFindWords = mongolTextcontroller.text.split(' ');
        autoWords = [];
      }
    } else if (key.keyType == VirtualKeyboardKeyType.Action) {
      switch (key.action) {
        case VirtualKeyboardKeyAction.Backspace:
          if (mongolTextcontroller.text.length > 0) {
            databaseWordsSee = true;
            deleteText();
            print('editor backspace' +
                mongolTextcontroller.text.length.toString());
            if (mongolTextcontroller.text.length == 0) {
              listViewTiinText.length = 0;
            }
            else if (mongolTextcontroller.text.length <= 1) {
              listViewTiinText = getListViewTiin(
                  mongolTextcontroller.text[mongolTextcontroller.text.length -
                      1]);
            }
            else
            if (mongolTextcontroller.text[mongolTextcontroller.text.length -
                2] == ' ' ||
                mongolTextcontroller.text[mongolTextcontroller.text.length -
                    2] == '\n') {
              print('aaaaaaaaaaaaaaaaa');
              listViewTiinText = getListViewTiin(
                  mongolTextcontroller.text[mongolTextcontroller.text.length -
                      1]);
            }
            else if (mongolTextcontroller.text.length == 0) {
              listViewTiinText.length = 0;
            }
            else
              listViewTiinText.length = 0;
          }
          else
            listViewTiinText.length = 0;
          break;
        case VirtualKeyboardKeyAction.Return:
          insertText('\n');
          listViewTiinText.length = 0;
          break;
        case VirtualKeyboardKeyAction.Space:
          String tiin;
          //////
          insertText(' ');
          listViewTiinText.length = 0;
          break;
        case VirtualKeyboardKeyAction.Shift:
          vkey_shiftEnabled = !vkey_shiftEnabled;
          break;
        case VirtualKeyboardKeyAction.Language:
          vkey_isNumericMode = !vkey_isNumericMode;
          break;
        case VirtualKeyboardKeyAction.Num:
          vkey_isNumericMode = !vkey_isNumericMode;
          break;
        case VirtualKeyboardKeyAction.Mon:
          vkey_isMongol = !vkey_isMongol;

          break;
        case VirtualKeyboardKeyAction.Arrow:
          vkey_isMongol = !vkey_isMongol;
          bigger = !bigger;
          break;
        default:
      }
    }
    // txtGalig = tungaamal.tun2cyr(mongolTextcontroller.text); //toCyrillic(txtMongol);
    // textController.text = txtGalig;
    dataWordLenght = mongolTextcontroller.text.split(' ');
    // tunMongolText = tungaamal.tun2tun(mongolTextcontroller.text);
    notifyListeners();
  }
}