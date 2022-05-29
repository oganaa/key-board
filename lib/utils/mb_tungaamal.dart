import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:mongol/mongol.dart';

import 'mb_char.dart';

class Tungaamal {
  static List<MbChar> chars;
  /*var _textController = new TextEditingController();*/
  String tunText = "";
  String latText = "";
  int count = 1;

  Tungaamal() {
    String arrayText;
    rootBundle.loadString("assets/social_json/mb_char.json").then((readTxt) {
      /*arrayText = readTxt;
      var charJson = json.decode(arrayText).cast<Map<String, dynamic>>();*/
      var charJson = json.decode(readTxt).cast<Map<String, dynamic>>();
      chars = charJson.map<MbChar>((cJson) => MbChar.fromJson(cJson)).toList();
      print('read chars length = ${chars.length}');
      /*_textController.addListener(textListener);*/
    });
  }
  String Huis(String latstr) {
    if (latstr.indexOf('э') >= 0 ||
        latstr.indexOf('е') >= 0 ||
        latstr.indexOf('ү') >= 0 ||
        latstr.indexOf('ө') >= 0) return "2";
    if (latstr.indexOf('а') >= 0 ||
        latstr.indexOf('о') >= 0 ||
        latstr.indexOf('у') >= 0 ||
        latstr.indexOf('я') >= 0 ||
        latstr.indexOf('ё') >= 0 ||
        latstr.indexOf('ю') >= 0)
      return "1";
    else
      return "2";
  }

  String huisLat(String latstr) {
    String str = latstr.replaceAll('-', '').replaceAll('.', '');
    //print(latstr.codeUnitAt(0));
    if (str.codeUnitAt(0) >= 65 && str.codeUnitAt(0) <= 122) {
      if (str.indexOf('e') >= 0) return "2";
      if (str.indexOf('a') >= 0 ||
          str.indexOf('o') >= 0 ||
          str.indexOf('ya') >= 0 ||
          str.indexOf('yo') >= 0)
        return "1";
      else
        return "2";
    } else if (str.codeUnitAt(0) >= 1040 && str.codeUnitAt(0) <= 1257) {
      if (str.indexOf('э') >= 0 ||
          str.indexOf('е') >= 0 ||
          str.indexOf('ү') >= 0 ||
          str.indexOf('ө') >= 0) return "2";
      if (str.indexOf('а') >= 0 ||
          str.indexOf('о') >= 0 ||
          str.indexOf('у') >= 0 ||
          str.indexOf('я') >= 0 ||
          str.indexOf('ё') >= 0 ||
          str.indexOf('ю') >= 0)
        return "1";
      else
        return "2";
    } else {
      if (str.indexOf('ᠡ') >= 0 ||
          str.indexOf('ᠶᠡ') >= 0 ||
          str.indexOf('ᠥ') >= 0 ||
          str.indexOf('ᠦ') >= 0 ||
          // latstr.indexOf('\u1889')>=0||
          str.indexOf('ᠶᠦ') >= 0)
        return "2";
      else if (str.indexOf('ᠠ') >= 0 ||
          str.indexOf('ᠣ') >= 0 ||
          str.indexOf('ᠤ') >= 0 ||
          str.indexOf('ᠶᠠ') >= 0 ||
          str.indexOf('ᠶᠣ') >= 0 ||
          // latstr.indexOf('\u182D') >= 0 ||
          // latstr.indexOf('ᠬ') >= 0 ||
          str.indexOf('ᠶᠤ') >= 0) {
        return "1";
      }
      return "2";
    }
    return "2";
  }

  String tungaamalTextHuis(String latstr) {
    if (latstr.indexOf('ᠡ') >= 0 ||
        latstr.indexOf('ᠶᠡ') >= 0 ||
        latstr.indexOf('ᠥ') >= 0 ||
        latstr.indexOf('ᠦ') >= 0 ||
        // latstr.indexOf('\u1889')>=0||
        latstr.indexOf('ᠶᠦ') >= 0) {
      return "2";
    }
    if (latstr.indexOf('ᠠ') >= 0 ||
        latstr.indexOf('ᠣ') >= 0 ||
        latstr.indexOf('ᠤ') >= 0 ||
        latstr.indexOf('ᠶᠠ') >= 0 ||
        latstr.indexOf('ᠶᠣ') >= 0 ||
        // latstr.indexOf('\u182D') >= 0 ||
        // latstr.indexOf('ᠬ') >= 0 ||
        latstr.indexOf('ᠶᠤ') >= 0) {
      return "1";
    }
    return "2";
  }

  String get_Tiin(String word) {
    if (word.codeUnitAt(0) >= 65 && word.codeUnitAt(0) <= 122) {
      if (word.length == 1 && word.substring(0, 1) == 'u') {
        return '\u202F\u1826';
      }
      if (word.length == 2 && word.substring(0, 2) == 'un') {
        return '\u202F\u1826\u1828';
      }
      if (word.length == 3 && (word.substring(0, 3) == 'iin')) {
        print('ccheck u');
        return '\u202F\u1836\u1822\u1828';
      }
      //заахын тийн ялгал
      if (word.length == 1 && (word.substring(0, 1) == 'i')) {
        return '\u202F\u1822';
      }
      if (word.length == 2 && (word.substring(0, 2) == 'ii')) {
        return '\u202F\u1836\u1822';
      }
      //өгөх оршихийн тйин ялгал
      if (word.length == 2 && word.substring(0, 2) == 'du') {
        return '\u202F\u1833\u1826';
      }
      if (word.length == 3 && word.substring(0, 3) == 'dur') {
        return '\u202F\u1833\u1826\u1837';
      }
      if (word.length == 2 && word.substring(0, 2) == 'tu') {
        return '\u202F\u1832\u1826';
      }
      if (word.length == 3 && word.substring(0, 3) == 'tur') {
        return '\u202F\u1832\u1826\u1837';
      }
      //гарахын тийн ялгал
      if (word.length == 4 &&
          (word.substring(0, 4) == 'atsa' ||
              word.substring(0, 4) == 'acha' ||
              word.substring(0, 4) == 'etse' ||
              word.substring(0, 4) == 'etse')) {
        return '\u202F\u1820\u1834\u1820';
      }
      //үйлдэхийн тийн ялгал
      if (word.length == 3 && (word.substring(0, 3) == 'bar')) {
        return '\u202F\u182A\u1820\u1837';
      }
      if (word.length == 4 && word.substring(0, 4) == 'iiar') {
        return '\u202F\u1822\u1836\u1821\u1837';
      }
      // olon too
      if (word.length == 2 && (word.substring(0, 2) == 'ud')) {
        return '\u202F\u1824\u1833';
      }
      if (word.length == 5 && (word.substring(0, 5) == 'nugud')) {
        return '\u202F\u1828\u1826\u1889\u1826\u1833';
      }
      return '';
    } else if (word.codeUnitAt(0) >= 1040 && word.codeUnitAt(0) <= 1257) {
      //харьяалахын тйин ялгал
      if (word.length == 1 &&
          (word.substring(0, 1) == 'ү' || word.substring(0, 1) == 'у')) {
        return '\u202F\u1826';
      }
      if (word.length == 2 &&
          (word.substring(0, 2) == 'үн' || word.substring(0, 2) == 'ун')) {
        return '\u202F\u1826\u1828';
      }
      if (word.length == 3 && (word.substring(0, 3) == 'йин')) {
        print('ccheck u');
        return '\u202F\u1836\u1822\u1828';
      }
      //заахын тийн ялгал
      if (word.length == 1 && (word.substring(0, 1) == 'и')) {
        return '\u202F\u1822';
      }
      if (word.length == 2 && (word.substring(0, 2) == 'йи')) {
        return '\u202F\u1836\u1822';
      }
      //өгөх оршихийн тйин ялгал
      if (word.length == 2 &&
          (word.substring(0, 2) == 'ду' || word.substring(0, 2) == 'дү')) {
        return '\u202F\u1833\u1826';
      }
      if (word.length == 3 &&
          (word.substring(0, 3) == 'дур' || word.substring(0, 3) == 'дүр')) {
        return '\u202F\u1833\u1826\u1837';
      }
      if (word.length == 2 &&
          (word.substring(0, 2) == 'ту' || word.substring(0, 2) == 'тү')) {
        return '\u202F\u1832\u1826';
      }
      if (word.length == 3 &&
          (word.substring(0, 3) == 'тур' || word.substring(0, 3) == 'түр')) {
        return '\u202F\u1832\u1826\u1837';
      }
      //гарахын тийн ялгал
      if (word.length == 3 &&
          (word.substring(0, 3) == 'аца' ||
              word.substring(0, 3) == 'ача' ||
              word.substring(0, 3) == 'эцэ' ||
              word.substring(0, 3) == 'эчэ')) {
        return '\u202F\u1820\u1834\u1820';
      }
      //үйлдэхийн тийн ялгал
      if (word.length == 3 &&
          (word.substring(0, 3) == 'бар' || word.substring(0, 3) == 'бэр')) {
        return '\u202F\u182A\u1820\u1837';
      }
      if (word.length == 4 &&
          (word.substring(0, 4) == 'ийэр' || word.substring(0, 4) == 'ийар')) {
        return '\u202F\u1822\u1836\u1821\u1837';
      }
      // olon too
      if (word.length == 2 &&
          (word.substring(0, 2) == 'уд' || word.substring(0, 2) == 'үд')) {
        return '\u202F\u1824\u1833';
      }
      if (word.length == 5 && (word.substring(0, 5) == 'нүгүд')) {
        return '\u202F\u1828\u1826\u1889\u1826\u1833';
      }
      return '';
    } else
      return '';
  }

  String cyr2Tun(String str) {
    List<String> latstr = str.split(' ');
    List<String> words = [];
    String result = '';
    int i = 0;
    for (int r = 0; r < latstr.length; r++) {
      // print('${r}=array = '+latstr[r]);
      while (i < latstr[r].length) {
        int j = 0;
        bool found = false;
        String tiin = get_Tiin(latstr[r]);
        if (tiin.length > 0) {
          result = tiin;
          // print('result tiin == '+result);
          break;
        }
        while (j < chars.length) {
          print('checking huis === ' + huisLat(latstr[r]));
          // emoji-г үгэн дотор ;) кодоор эсвэл unicode кодоор нь ялгаж таньж гаргадаг болгох
          if (chars[j].cyr.length <= latstr[r].length - i &&
              latstr[r].substring(i, i + chars[j].cyr.length) == chars[j].cyr &&
              (chars[j].huis == "3" || huisLat(latstr[r]) == chars[j].huis)) {
            print('found char i = ' + j.toString() + ' , ' + chars[j].tunUni);
            result += chars[j].tunUni;
            print('result = ' + result);
            if (chars[j].cyr.length > 1) i += chars[j].cyr.length - 1;
            found = true;
            break;
          }
          j++;
        }
        if (!found) {
          // print('no result , len == '+latstr[r].length.toString() + ' latstr = '+latstr[r]);
          //if(latstr[r].length>=0) {
          result += latstr[r].substring(i, i + 1); //i += latstr[r].length - 1;
          //print('emoji result == '+result);
          //}
        }
        i++;
      }
      words.add(result);
      result = '';
      i = 0;
    }
    return words.join(' ');
  }

  String lat2Tun(String str) {
    List<String> latstr = str.split(' ');
    List<String> words = [];
    String result = '';
    int i = 0;
    for (int r = 0; r < latstr.length; r++) {
      // print('${r}=array = '+latstr[r]);
      while (i < latstr[r].length) {
        int j = 0;
        String tiin = get_Tiin(latstr[r]);
        if (tiin.length > 0) {
          result = tiin;
          break;
        }
        while (j < chars.length) {
          if (chars[j].lat.length <= latstr[r].length - i &&
              latstr[r].substring(i, i + chars[j].lat.length) == chars[j].lat &&
              (chars[j].huis == "3" || huisLat(latstr[r]) == chars[j].huis)) {
            result += chars[j].tunUni;
            // print('result'+result);
            if (chars[j].lat.length > 1) i += chars[j].lat.length - 1;
            break;
          }
          j++;
        }
        i++;
      }
      words.add(result);
      result = '';
      i = 0;
    }
    return words.join(' ');
  }

  String tun2cyr(String str) {
    List<String> latstr = str.split(' ');
    List<String> words = [];
    String result = '';
    int i = 0;
    for (int i = 0; i < chars.length; i++) {
      if (latstr[0] == chars[i].tunUni) {
        if (huisLat(latstr[0]) == chars[i].huis) {
          print("YES" + chars[i].huis.toString());
        }
      }
    }
    for (int r = 0; r < latstr.length; r++) {
      //print('${r}=array = '+latstr[r]);
      while (i < latstr[r].length) {
        int j = 0;
        bool found = false;
        /*     String tiin= get_Tiin(latstr[r]);
        if(tiin.length>0) { result = tiin;
          print('result tiin == '+result); break;
        }*/
        while (j < chars.length) {
          // emoji-г үгэн дотор ;) кодоор эсвэл unicode кодоор нь ялгаж таньж гаргадаг болгох
          if (chars[j].tunChar.length <= latstr[r].length - i &&
              latstr[r].substring(i, i + chars[j].tunChar.length) ==
                  chars[j].tunUni &&
              (chars[j].huis == "3" || huisLat(latstr[r]) == chars[j].huis)) {
            result += chars[j].cyr;
            //print('result = '+result);
            if (chars[j].tunChar.length > 1) i += chars[j].tunChar.length - 1;
            found = true;
            break;
          }
          j++;
        }
        if (!found) {
          // print('aaaaaaaaaaaaaaaaaaaaaaaaa');
          print('no result , len == ' +
              latstr[r].length.toString() +
              ' latstr = ' +
              latstr[r]);
          //if(latstr[r].length>=0) {
          result += latstr[r].substring(i, i + 1); //i += latstr[r].length - 1;
          //print('emoji result == '+result);
          //}
        }
        i++;
      }
      words.add(result);
      result = '';
      i = 0;
    }
    return words.join(' ');
  }

  String tun2tun(String str) {
    print(str);
    List<String> latstr = str.split(' ');
    List<String> words = [];
    String result = '';
    int i = 0;
    for (int r = 0; r < latstr.length; r++) {
      //print('${r}=array = '+latstr[r]);
      while (i < latstr[r].length) {
        if (tungaamalTextHuis(latstr[r]) == "2") {
          // print('em ug h ');
          if (latstr[r][i] == 'ᠭ') {
            result = result + '\u1889';
          } else if (latstr[r][i] == 'ᠬ') {
            result = result + 'ᢈ';
          } else
            result = result + latstr[r][i];
        } else if (tungaamalTextHuis(latstr[r]) == "1") {
          // print('er ug h ');
          if (latstr[r].length > i + 1 &&
              latstr[r][i] == 'ᠭ' &&
              latstr[r][i + 1] == 'ᠢ') {
            result = result + '\u1889ᠢ';
            i++;
          } else if (latstr[r].length > i + 1 &&
              latstr[r][i] == 'ᠬ' &&
              latstr[r][i + 1] == 'ᠢ') {
            result = result + '\u1888ᠢ';
            i++;
          } else if (latstr[r][i] == '\u1889' && latstr[r][i + 1] != 'ᠢ') {
            result = result + 'ᠭ';
          } else if (latstr[r][i] == 'ᢈ' && latstr[r][i + 1] != 'ᠢ') {
            result = result + 'ᠬ';
          } else
            result = result + latstr[r][i];
        }
        i++;
      }
      words.add(result);
      result = '';
      i = 0;
    }
    return words.join(' ');
  }
  /*textListener() {
    print("Current Text is ${_textController.text}");
    return _textController.text;
  }*/

  /*void convert() {
    setState(() {
      print(count);
      switch(count)
      {
        case 1: tunText = cyr2Tun(_textController.text); break;
        case 2: latText = lat2Tun(_textController.text); break;
        default: {
          print('null');
        }
        break;
      }
    //  tunText = cyr2Tun(_textController.text);
    // latText = lat2Tun(_textController.text);
    });
  }*/

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  'Монгол бичиг',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                //width: 100,
                decoration:  BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    )
                ),
                child: TextField(
                  controller: _textController,
                  onChanged: (text) {
                    print("Text $text");
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'input text'),
                ),
              ),
              Container(
                decoration:  BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    )
                ),
                child:FlatButton(
                  child: Text('Convert'),
                  onPressed: () {
                    convert();
                  },
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme
                          .of(context)
                          .primaryColor,
                      width: 2,
                    )
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    MongolText(
                      count==1? tunText: latText,
                      style: TextStyle(
                          fontSize: 36,
                          fontFamily: 'Classical Mongolian Dashtseden'),
                    ),
                  ],
                ),
              ),
              Container(
                decoration:  BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    )
                ),
                child:FlatButton(
                  child: Text('changeText'),
                  onPressed: () {
                    count=count%2+1;
                  },
                ),
              ),
            ],
          ),
        ),
      )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }*/
}
