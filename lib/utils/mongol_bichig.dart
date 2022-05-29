import 'package:flutter/material.dart';

bool isMongolTxt (String txt) {
  if(txt==null) return false;
  // Эгшигүүдийг шалгах - А Э И О У
  // Тухайн текстэнд эдгээр үсэгнүүд орсон бол МОНГОЛ БИЧИГ гэж үзнэ
  if( txt.contains('ᠣ') || txt.contains('ᠢ') || txt.contains('ᠠ') ||
      txt.contains('ᠡ') || txt.contains('ᠤ') || txt.contains('ᠦ')
    ) {
    return true;
  }
  return false;
}

String toCyrillic (String txt) {
  var newtxt = '';
  //console.log('checking is Mongol Bichig...');
  // Эгшигүүдийг шалгах - А Э И О У
  // Тухайн текстэнд эдгээр үсэгнүүд орсон бол МОНГОЛ БИЧИГ гэж үзнэ
  //
  for( var i = 0 ; i < txt.length; i++ ) {
    if(txt[i]=='ᠣ') newtxt= newtxt+'о';
    else if(txt[i]=='ᠤ') newtxt= newtxt+'у';
    else if(txt[i]=='ᠢ') newtxt= newtxt+'и';
    else if(txt[i]=='ᠯ') newtxt= newtxt+'л';
    else if(txt[i]=='ᠵ') newtxt= newtxt+'ж';
    else if(txt[i]=='ᠪ') newtxt= newtxt+'б';
    else if(txt[i]=='ᠷ') newtxt= newtxt+'р';
    else if(txt[i]=='ᠱ') newtxt= newtxt+'ш';
    else if(txt[i]=='ᠬ') newtxt= newtxt+'х';
    else if(txt[i]=='ᠠ') newtxt= newtxt+'а';
    else if(txt[i]=='ᠴ') newtxt= newtxt+'ч';
    else if(txt[i]=='ᠩ') newtxt= newtxt+'н';
    else if(txt[i]=='ᠬ') newtxt= newtxt+'х';
    else if(txt[i]=='ᠦ') newtxt= newtxt+'ү';
    else if(txt[i]=='ᠭ') newtxt= newtxt+'г';
    else if(txt[i]=='ᠡ') newtxt= newtxt+'э';
    else if(txt[i]=='ᠲ') newtxt= newtxt+'т';
    else if(txt[i]=='ᠮ') newtxt= newtxt+'м';
    else if(txt[i]=='ᠨ') newtxt= newtxt+'н';
    else if(txt[i]=='ᠻ') newtxt= newtxt+'к';
    else if(txt[i]=='ᠶ') newtxt= newtxt+'й';
    else if(txt[i]=='ᠳ') newtxt= newtxt+'д';
    else if(txt[i]=='ᠰ') newtxt= newtxt+'с';

    else if(txt[i]=='᠐') newtxt= newtxt+'0';
    else if(txt[i]=='᠑') newtxt= newtxt+'1';
    else if(txt[i]=='᠒') newtxt= newtxt+'2';
    else if(txt[i]=='᠓') newtxt= newtxt+'3';
    else if(txt[i]=='᠔') newtxt= newtxt+'4';
    else if(txt[i]=='᠕') newtxt= newtxt+'5';
    else if(txt[i]=='᠖') newtxt= newtxt+'6';
    else if(txt[i]=='᠗') newtxt= newtxt+'7';
    else if(txt[i]=='᠘') newtxt= newtxt+'8';
    else if(txt[i]=='᠙') newtxt= newtxt+'9';
    else if(txt[i]=='ᠥ') newtxt= newtxt+'ө';

    else if(txt[i]=='᠃') newtxt= newtxt+'.';
    else if(txt[i]=='᠂') newtxt= newtxt+',';

    else if(txt[i]=='ᠸ') newtxt= newtxt+'в';
    else if(txt[i]=='ᠧ') newtxt= newtxt+'е';


    else newtxt= newtxt+txt[i];
  }
  newtxt=(newtxt.split('ии')).join('ий');
  newtxt=(newtxt.split('йү')).join('ю');
  newtxt=(newtxt.split('айи')).join('ай');

  return newtxt;
}

String strLess(String ss, int maxlen)
{
  int len = ss.length;
  int Index = 0;
  if(len<maxlen) return ss;

  for(var i=maxlen; i<ss.length; i++)
    if( ss.substring(i,i+1)==' ' )
    {
      return ss.substring(0, i);
    }
  return ss.substring(0, maxlen);
}