// import 'dart:math';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:mongol/mongol.dart';
// import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart'
// import 'dart:ui';
// import 'PostUploadContoller.dart';
//
// class PostUploadView extends StatelessWidget {
//   PostUploadView({Key key}) : super(key: key);
//
//   Widget gestureDetectorLeft(BuildContext context, model) {
//     double width = MediaQuery.of(context).size.width;
//     double height = model.sketchHeight; //MediaQuery.of(context).size.height;
//     return model.rightPosiotion != null && model.sketchArea != null
//         ? model.sketchArea
//         : Container();
//   }
//
//   Widget gestureDetectorRight(BuildContext context, model) {
//     double width = MediaQuery.of(context).size.width;
//     double height = model.sketchHeight; //MediaQuery.of(context).size.height;
//     return model.rightPosiotion != null && model.sketchArea != null
//         ? model.sketchArea
//         : Container(); //SketchView(model.sketchHeight, false);
//   }
//
//   Widget deleteButton(model) {
//     return Container(
//       width: model.contextWidth != 0 ? model.contextWidth / 5 : 40,
//       //color: Colors.white,
//       child: IconButton(
//         icon: Icon(Icons.refresh),
//         onPressed: () {},
//       ),
//     );
//   }
//
//   Widget newLineButton(model) {
//     return Container(
//       width: model.contextWidth != 0 ? model.contextWidth / 5 : 40,
//       //color: newColor,
//       child: IconButton(
//         //highlightColor:  Colors.grey,
//         //hoverColor: Colors.grey,
//         icon: Icon(Icons.subdirectory_arrow_left),
//         onPressed: () {
//           model.newLine();
//         },
//       ),
//     );
//   }
//
//   Widget addImageButton(model) {
//     return Container(
//       width: model.contextWidth != 0 ? model.contextWidth / 5 : 40,
//       child: IconButton(
//         color: Colors.green,
//         icon: Icon(Icons.check),
//         onPressed: () {},
//       ),
//     );
//   }
//
//   Widget deleteImageButton(model) {
//     return Container(
//       width: model.contextWidth != 0 ? model.contextWidth / 5 : 40,
//       //color: Colors.white,
//       child: IconButton(
//         color: Colors.red,
//         icon: Icon(Icons.arrow_upward),
//         onPressed: () {
//           model.backSpace();
//         },
//       ),
//     );
//   }
//
//   Widget exitButton(model) {
//     return Container(
//       width: model.contextWidth != 0 ? model.contextWidth / 5 : 40,
//       //color: Colors.white,
//       child: IconButton(
//         color: Colors.black,
//         iconSize: 20,
//         icon: Icon(Icons.clear),
//         onPressed: () {},
//       ),
//     );
//   }
//
//   Widget leftPositionButton(model) {
//     return Container(
//       width: model.contextWidth != 0 ? model.contextWidth / 5 : 40,
//       child: IconButton(
//         color: Colors.blue,
//         icon: Icon(Icons.arrow_left),
//         onPressed: () {
//           model.changeLeftRight();
//         },
//       ),
//     );
//   }
//
//   Widget rightPositionButton(model) {
//     return Container(
//       width: model.contextWidth != 0 ? model.contextWidth / 5 : 40,
//       child: IconButton(
//         color: Colors.blue,
//         icon: Icon(Icons.compare_arrows),
//         onPressed: () {
//           model.changeLeftRight();
//         },
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<PostUploadCtrl>.reactive(
//         viewModelBuilder: () => PostUploadCtrl(),
//         onModelReady: (model) {
//           model.setParameter(this.newPost);
//           model.initialise(context);
//         },
//         builder: (context, model, child) => Scaffold(
//               appBar: AppBar(
//                 title: Text(model.windowTitle,
//                     style: TextStyle(
//                         color: Colors.black, fontSize: ScreenUtil().setSp(30))),
//                 backgroundColor: Colors.white,
//                 elevation: 1,
//                 leading: new IconButton(
//                   icon: Icon(Icons.arrow_back, color: Colors.black),
//                   onPressed: () => Navigator.of(context).pop(),
//                 ),
//                 actions: <Widget>[
//                   MaterialButton(
//                     // onPressed: () {
//                     //   model.createPost(context);
//                     // },
//                     child:
//                         /*new IconButton(
//                       color: Colors.black,
//                       icon: new Icon(Icons.save_outlined), onPressed: () {
//                       model.createPost(context);
//                     },),*/
//
//                 ],
//               ),
//               body: Container(
//                 height: ,
//                 //MediaQuery.of(context).size.height,
//                 color: Colors.white,
//                 child: Column(
//                   children: <Widget>[
//                     // Avatar and Username
//                     model.selectKeyboard[3]
//                         ? Container()
//                         : Container(
//                             margin: EdgeInsets.only(
//                                 left: ScreenUtil().setWidth(35),
//                                 right: ScreenUtil().setWidth(20),
//                                 top: ScreenUtil().setHeight(30),
//                                 bottom: ScreenUtil().setHeight(10)),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: <Widget>[
//                                 CircleAvatar(
//                                   maxRadius: 25,
//                                   backgroundImage:
//                                       NetworkImage(model.newPost.avatar),
//                                 ),
//                                 SizedBox(width: ScreenUtil().setWidth(20)),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: <Widget>[
//                                     Text(
//                                         model.newPost.insertfname +
//                                             ' ' +
//                                             model.newPost.insertname,
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: ScreenUtil().setSp(30))),
//                                     SizedBox(
//                                         height: ScreenUtil().setHeight(20)),
//                                     curUser.post_upload_purpose != 4
//                                         ? FlatButton(
//                                             materialTapTargetSize:
//                                                 MaterialTapTargetSize
//                                                     .shrinkWrap,
//                                             padding: EdgeInsets.all(0.0),
//                                             onPressed: () {
//                                               model.JumpToViewTypeView();
//                                             },
//                                             child: Container(
//                                                 padding: EdgeInsets.only(
//                                                     left: ScreenUtil()
//                                                         .setWidth(5),
//                                                     right: ScreenUtil()
//                                                         .setWidth(5),
//                                                     top: ScreenUtil()
//                                                         .setHeight(0),
//                                                     bottom: ScreenUtil()
//                                                         .setHeight(0)),
//                                                 decoration: BoxDecoration(
//                                                     border: Border.all(),
//                                                     borderRadius: BorderRadius.all(
//                                                         Radius.circular(5.0))),
//                                                 child: curUser
//                                                             .post_upload_scopeid ==
//                                                         4
//                                                     ? Row(
//                                                         children: <Widget>[
//                                                           Icon(
//                                                             Icons.lock,
//                                                             size: ScreenUtil()
//                                                                 .setSp(24),
//                                                           ),
//                                                           SizedBox(
//                                                               width:
//                                                                   ScreenUtil()
//                                                                       .setWidth(
//                                                                           5)),
//                                                           Text('Нийтэд',
//                                                               style: TextStyle(
//                                                                   color: Colors
//                                                                       .black,
//                                                                   fontSize:
//                                                                       ScreenUtil()
//                                                                           .setSp(
//                                                                               25),
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w300)),
//                                                           Icon(
//                                                             Icons
//                                                                 .arrow_drop_down,
//                                                             size: ScreenUtil()
//                                                                 .setSp(24),
//                                                           ),
//                                                         ],
//                                                       )
//                                                     : curUser.post_upload_scopeid ==
//                                                             3
//                                                         ? Row(
//                                                             children: <Widget>[
//                                                               Icon(
//                                                                 Icons.lock,
//                                                                 size:
//                                                                     ScreenUtil()
//                                                                         .setSp(
//                                                                             24),
//                                                               ),
//                                                               SizedBox(
//                                                                   width: ScreenUtil()
//                                                                       .setWidth(
//                                                                           5)),
//                                                               Text('Нийтйин',
//                                                                   style: TextStyle(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize: ScreenUtil()
//                                                                           .setSp(
//                                                                               25),
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w300)),
//                                                               Icon(
//                                                                 Icons
//                                                                     .arrow_drop_down,
//                                                                 size:
//                                                                     ScreenUtil()
//                                                                         .setSp(
//                                                                             24),
//                                                               ),
//                                                             ],
//                                                           )
//                                                         : curUser.post_upload_scopeid ==
//                                                                 2
//                                                             ? Row(
//                                                                 children: <
//                                                                     Widget>[
//                                                                   Icon(
//                                                                     Icons.lock,
//                                                                     size: ScreenUtil()
//                                                                         .setSp(
//                                                                             24),
//                                                                   ),
//                                                                   SizedBox(
//                                                                       width: ScreenUtil()
//                                                                           .setWidth(
//                                                                               5)),
//                                                                   Text(
//                                                                       'Найзуудад',
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .black,
//                                                                           fontSize: ScreenUtil().setSp(
//                                                                               25),
//                                                                           fontWeight:
//                                                                               FontWeight.w300)),
//                                                                   Icon(
//                                                                     Icons
//                                                                         .arrow_drop_down,
//                                                                     size: ScreenUtil()
//                                                                         .setSp(
//                                                                             24),
//                                                                   ),
//                                                                 ],
//                                                               )
//                                                             : curUser.post_upload_scopeid == 1
//                                                                 ? Row(
//                                                                     children: <
//                                                                         Widget>[
//                                                                       Icon(
//                                                                         Icons
//                                                                             .lock,
//                                                                         size: ScreenUtil()
//                                                                             .setSp(24),
//                                                                       ),
//                                                                       SizedBox(
//                                                                           width:
//                                                                               ScreenUtil().setWidth(5)),
//                                                                       Text(
//                                                                           'Зөвхөн надад',
//                                                                           style: TextStyle(
//                                                                               color: Colors.black,
//                                                                               fontSize: ScreenUtil().setSp(25),
//                                                                               fontWeight: FontWeight.w300)),
//                                                                       Icon(
//                                                                         Icons
//                                                                             .arrow_drop_down,
//                                                                         size: ScreenUtil()
//                                                                             .setSp(24),
//                                                                       ),
//                                                                     ],
//                                                                   )
//                                                                 : Row(
//                                                                     children: <
//                                                                         Widget>[
//                                                                       Icon(
//                                                                         Icons
//                                                                             .lock,
//                                                                         size: ScreenUtil()
//                                                                             .setSp(24),
//                                                                       ),
//                                                                       SizedBox(
//                                                                           width:
//                                                                               ScreenUtil().setWidth(5)),
//                                                                       Text(
//                                                                           'hhah надад',
//                                                                           style: TextStyle(
//                                                                               color: Colors.black,
//                                                                               fontSize: ScreenUtil().setSp(25),
//                                                                               fontWeight: FontWeight.w300)),
//                                                                       Icon(
//                                                                         Icons
//                                                                             .arrow_drop_down,
//                                                                         size: ScreenUtil()
//                                                                             .setSp(24),
//                                                                       ),
//                                                                     ],
//                                                                   )),
//                                           )
//                                         : Text('' +
//                                             model.images.length.toString() +
//                                             ' зураг, нийт ' +
//                                             model.total_file_size.toString() +
//                                             'Mb хэмжээтэй')
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                     model.activeTab == 'story' && model.activeStory > 0
//                         ? Container(
//                             padding: EdgeInsets.only(left: 7, right: 7),
//                             color: Colors.white,
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               children: [
//                                 Expanded(
//                                   child: RaisedButton(
//                                     elevation: 0,
//                                     color: model.activeAction == 'text'
//                                         ? Colors.blue
//                                         : Colors.white,
//                                     onPressed: () {
//                                       model.storySet_Element('text');
//                                       print('Text onpressed!!!!!');
//                                     },
//                                     child: Icon(
//                                       Icons.format_color_text,
//                                       color: model.activeAction == 'text'
//                                           ? Colors.white
//                                           : Colors.grey,
//                                       size: ScreenUtil().setSp(40),
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: RaisedButton(
//                                     elevation: 0,
//                                     color: model.activeAction == 'background'
//                                         ? Colors.blue
//                                         : Colors.white,
//                                     onPressed: () {
//                                       model.storySet_Element('background');
//                                       print('Text onpressed!!!!!');
//                                     },
//                                     child: Icon(
//                                       Icons.image,
//                                       color: model.activeAction == 'background'
//                                           ? Colors.white
//                                           : Colors.grey,
//                                       size: ScreenUtil().setSp(40),
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: RaisedButton(
//                                     elevation: 0,
//                                     color: model.activeAction == 'image'
//                                         ? Colors.blue
//                                         : Colors.white,
//                                     onPressed: () {
//                                       model.storySet_Element('image');
//                                       print('Text onpressed!!!!!');
//                                     },
//                                     child: Icon(
//                                       Icons.add_a_photo_outlined,
//                                       color: model.activeAction == 'image'
//                                           ? Colors.white
//                                           : Colors.grey,
//                                       size: ScreenUtil().setSp(40),
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: RaisedButton(
//                                     elevation: 0,
//                                     color: model.activeAction == 'position'
//                                         ? Colors.blue
//                                         : Colors.white,
//                                     onPressed: () {
//                                       model.storySet_Element('position');
//                                       print('Text onpressed!!!!!');
//                                     },
//                                     child: Icon(
//                                       Icons.gps_fixed,
//                                       color: model.activeAction == 'position'
//                                           ? Colors.white
//                                           : Colors.grey,
//                                       size: ScreenUtil().setSp(40),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ))
//                         : Container(),
//                     model.activeTab == 'story' &&
//                             model.activeStory > 0 &&
//                             model.activeAction == 'position'
//                         ? Wrap(
//                             children: model.storyPositions
//                                 .map((item) => Card(
//                                     child: Container(
//                                         alignment: Alignment.center,
//                                         decoration: BoxDecoration(
//                                             border:
//                                                 Border.all(color: Colors.grey)),
//                                         height: 60,
//                                         width: 120,
//                                         child: Text(item))))
//                                 .toList()
//                                 .cast<Widget>(),
//                           )
//                         : Container(),
//                     model.activeTab == 'story' &&
//                             model.activeStory > 0 &&
//                             model.activeAction == 'background'
//                         ? Wrap(
//                             children: model.storyElements
//                                 .map((item) => Card(
//                                     child: item['type'] == 'color'
//                                         ? Container(
//                                             height: 60,
//                                             width: 60,
//                                             color: item["type"] == "color"
//                                                 ? model.fromHex(item["color"])
//                                                 : Colors.white,
//                                           )
//                                         : Container(
//                                             height: 60,
//                                             width: 60,
//                                             decoration: BoxDecoration(
//                                               image: DecorationImage(
//                                                 image: AssetImage(
//                                                     'assets/' + item['thumb']),
//                                                 fit: BoxFit.fill,
//                                               ),
//                                             ),
//                                             //color: Color.fromARGB(Random().nextInt(255), Random().nextInt(255),
//                                             //    Random().nextInt(255), Random().nextInt(255)   )
//                                           )))
//                                 .toList()
//                                 .cast<Widget>(),
//                           )
//                         : Container(),
//                     model.activeTab == 'album' && model.activeAlbum >= 0
//                         ? Container(
//                             padding: EdgeInsets.only(left: 7, right: 7),
//                             color: Colors.white,
//                             child: Row(
//                               mainAxisSize: MainAxisSize.max,
//                               children: [
//                                 Expanded(
//                                   child: RaisedButton(
//                                     elevation: 0,
//                                     color: model.activeAction == 'text'
//                                         ? Colors.blue
//                                         : Colors.white,
//                                     onPressed: () {
//                                       model.albumSet_Element('text');
//                                       print('Text onpressed!!!!!');
//                                     },
//                                     child: Icon(
//                                       Icons.format_color_text,
//                                       color: model.activeAction == 'text'
//                                           ? Colors.white
//                                           : Colors.grey,
//                                       size: ScreenUtil().setSp(40),
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: RaisedButton(
//                                     elevation: 0,
//                                     color: model.activeAction == 'background'
//                                         ? Colors.blue
//                                         : Colors.white,
//                                     onPressed: () {
//                                       model.albumSet_Element('background');
//                                       print('Background onpressed!!!!!');
//                                     },
//                                     child: Icon(
//                                       Icons.image,
//                                       color: model.activeAction == 'background'
//                                           ? Colors.white
//                                           : Colors.grey,
//                                       size: ScreenUtil().setSp(40),
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: RaisedButton(
//                                     elevation: 0,
//                                     color: model.activeAction == 'position'
//                                         ? Colors.blue
//                                         : Colors.white,
//                                     onPressed: () {
//                                       model.albumSet_Element('position');
//                                       print('Text onpressed!!!!!');
//                                     },
//                                     child: Icon(
//                                       Icons.gps_fixed,
//                                       color: model.activeAction == 'position'
//                                           ? Colors.white
//                                           : Colors.grey,
//                                       size: ScreenUtil().setSp(40),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ))
//                         : Container(),
//                     // Mongol bichig Text Field
//                     // Choosed images
//                     model.activeTab == 'image'
//                         ? Expanded(
//                             child: curUser.post_upload_purpose != 4 ||
//                                     model.images.length == 0
//                                 ? ListView.builder(
//                                     //controller: model.scrollController,
//                                     itemCount: model.images.length + 1,
//                                     itemBuilder: (context, index) {
//                                       return Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           index == 0 ||
//                                                   index == model.images.length
//                                               ? Container(
//                                                   padding:
//                                                       EdgeInsets.only(top: 20),
//                                                   alignment: Alignment.center,
//                                                   height: 110,
//                                                   child: FlatButton(
//                                                     padding: EdgeInsets.only(
//                                                         top: 10),
//                                                     height: 110,
//                                                     color: Colors.grey[100],
//                                                     onPressed: () {
//                                                       model
//                                                           .getImage(); //ImageSource.camera);
//                                                     },
//                                                     child: Column(children: [
//                                                       Icon(
//                                                         Icons.camera_alt,
//                                                         color: Colors.blue,
//                                                         size: ScreenUtil()
//                                                             .setSp(80),
//                                                       ),
//                                                       Text('Зураг нэмэх')
//                                                     ]),
//                                                   ))
//                                               : Container(),
//                                           index >= 0 &&
//                                                   index < model.images.length
//                                               ? Container(
//                                                   height: 150,
//                                                   child:
//                                                       index ==
//                                                               model.images
//                                                                       .length +
//                                                                   1
//                                                           ? Container()
//                                                           : Card(
//                                                               color: Colors
//                                                                   .grey[200],
//                                                               child: Row(
//                                                                 children: [
//                                                                   Expanded(
//                                                                       flex: 40,
//                                                                       child:
//                                                                           AssetThumb(
//                                                                         asset: model
//                                                                             .images[index],
//                                                                         width:
//                                                                             250,
//                                                                         height:
//                                                                             250,
//                                                                       )
//                                                                       /*Image.memory(
//                                               model.base64Image(
//                                                   model.images[index]. ),
//                                               width: 250,
//                                               height: 250,
//                                               fit: BoxFit.fitWidth,
//                                             )*/
//                                                                       ),
//                                                                   Expanded(
//                                                                     flex: 60,
//                                                                     child:
//                                                                         Column(
//                                                                       children: [
//                                                                         Padding(
//                                                                           padding: EdgeInsets.only(
//                                                                               left: ScreenUtil().setWidth(10),
//                                                                               right: ScreenUtil().setWidth(10)),
//                                                                           child:
//                                                                               TextField(
//                                                                             autofocus:
//                                                                                 true,
//                                                                             onTap:
//                                                                                 () {
//                                                                               //FocusScope.of(context).requestFocus(FocusNode());
//                                                                               if (model.selectKeyboard[2])
//                                                                                 SystemChannels.textInput.invokeMethod('TextInput.hide');
//                                                                             },
//                                                                             textInputAction:
//                                                                                 TextInputAction.done,
//                                                                             maxLines:
//                                                                                 3,
//                                                                             decoration:
//                                                                                 InputDecoration(border: InputBorder.none, hintText: 'Зургийн тайлбар бичих'),
//                                                                           ),
//                                                                         )
//                                                                       ],
//                                                                     ),
//                                                                   )
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                 )
//                                               : Container(),
//                                         ],
//                                       );
//                                     })
//                                 : SingleChildScrollView(
//                                     child: Wrap(
//                                       children: model.images
//                                           .map((img) => FutureBuilder(
//                                                   future: model
//                                                       .assetThumbToImageProvider(
//                                                           img),
//                                                   builder: (context, snapshot) {
//                                                     return snapshot.hasData
//                                                         ? Container(
//                                                             padding:
//                                                                 EdgeInsets.zero,
//                                                             width: ScreenUtil()
//                                                                 .setWidth(250),
//                                                             height: ScreenUtil()
//                                                                 .setHeight(250),
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               image:
//                                                                   new DecorationImage(
//                                                                 fit: BoxFit
//                                                                     .cover,
//                                                                 image: snapshot
//                                                                         .data
//                                                                     as ImageProvider,
//                                                               ),
//                                                             ),
//                                                             child: Container())
//                                                         : Container();
//                                                   })
//                                               //assetThumbToImage(img)
//                                               /*AssetThumb(
//                                   asset: img,
//                                   width: ScreenUtil().setWidth(250).floor(),
//                                   height: ScreenUtil().setWidth(250).floor(),
//                                 )*/
//                                               )
//                                           .toList()
//                                           .cast<Widget>(),
//                                     ),
//                                   ))
//                         : Container(),
//                     model.activeTab == 'text'
//                         ? Expanded(
//                             child: Container(
//                                 //color: Colors.black,
//                                 //width: ScreenUtil().setWidth(750),
//                                 child: Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Padding(
//                                         padding: EdgeInsets.only(
//                                             left: ScreenUtil().setWidth(20),
//                                             right: ScreenUtil().setWidth(20)),
//                                         child: SingleChildScrollView(
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: <Widget>[
//                                               model.selectKeyboard[
//                                                       1] // Mongol bichig Text Field
//                                                   ? Container(
//                                                       height: ScreenUtil()
//                                                           .setHeight(350),
//                                                       child: ListView(
//                                                           scrollDirection:
//                                                               Axis.horizontal,
//                                                           children: <Widget>[
//                                                             MongolText(
//                                                                 /*'ᠮᠣᠨᢉᠭᠣᠯ \n ᠮᠣᠨᢉᠭᠣᠯ \n ᠮᠣᠨᢉᠭᠣᠯ \n ᠮᠣᠨᢉᠭᠣᠯ'*/
//                                                                 model.txtMongol,
//                                                                 style: TextStyle(
//                                                                     fontSize: ScreenUtil().setSp(30),
//                                                                     /*fontWeight: FontWeight.w100,*/
//                                                                     fontFamily: 'Classical Mongolian Dashtseden')),
//                                                           ]),
//                                                     )
//                                                   : Container(),
//                                             ],
//                                           ),
//                                         )))),
//                           )
//                         : Container(),
//                     model.activeTab == 'tag'
//                         ? Expanded(
//                             child: Container(
//                               padding: EdgeInsets.only(top: 20),
//                               color: Colors.white,
//                               child: model.taggedPeople.length > 0
//                                   ? Tags(
//                                       key: Key("2"),
//                                       itemCount: model.taggedPeople.length,
//                                       itemBuilder: (int index) {
//                                         print(
//                                             'itemBuilder , count = ${model.taggedPeople.length} , index = ${index}');
//                                         return ItemTags(
//                                           textColor: Colors.black,
//                                           highlightColor: Colors.black,
//                                           index: index,
//                                           combine:
//                                               ItemTagsCombine.withTextAfter,
//                                           title: model.taggedPeople[index]
//                                               ['name'],
//                                           activeColor: Colors.green[300],
//                                           splashColor: Colors.green,
//                                           image: ItemTagsImage(
//                                               image: NetworkImage(
//                                                   model.taggedPeople[index]
//                                                       ['img_name'])),
//                                           removeButton: ItemTagsRemoveButton(
//                                             backgroundColor: Colors.red[900],
//                                             onRemoved: () {
//                                               model.onTagDelete(index);
//                                               return true;
//                                             },
//                                           ),
//                                           textScaleFactor: 1,
//                                           textStyle: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 18,
//                                           ),
//                                         );
//                                       },
//                                     )
//                                   : Container(),
//                               //width: ScreenUtil().setWidth(750),
//                             ),
//                           )
//                         : Container(),
//                     model.activeTab == 'milestone'
//                         ? Expanded(
//                             child: Container(
//                               color: Colors.white,
//                               child: ListView.builder(
//                                 itemCount: model.milestones.length,
//                                 itemBuilder: (context, ind) {
//                                   return RadioListTile(
//                                     title: Text(model.milestones[ind]['name']
//                                         .toString()),
//                                     value: ind,
//                                     groupValue: model.selected_Mile_ind,
//                                     selected: ind == model.selected_Mile_ind,
//                                     onChanged: (ind) {
//                                       if (model.milestones[ind]['id'] != 900) {
//                                         model.setActiveMile(ind);
//                                         model.newPost.milestone =
//                                             model.milestones[ind]['id'];
//                                         print(
//                                             'item = ${ind} value = ${model.newPost.milestone}');
//                                       }
//                                       //item['selected'] = true;
//                                       //model.milestones[ind]['selected'] = newvalue;
//                                       //print('milestone = ${model.milestones[ind]['name']}');
//                                     },
//                                   );
//                                 },
//                               ),
//                               //width: ScreenUtil().setWidth(750),
//                             ),
//                           )
//                         : Container(),
//                     model.activeTab == 'color'
//                         ? Expanded(
//                             child: Container(
//                               color: Colors.white,
//                               //width: ScreenUtil().setWidth(750),
//                             ),
//                           )
//                         : Container(),
//                     model.activeTab == 'story' && model.activeStory == -1
//                         ? Expanded(
//                             child: Column(
//                             children: [
//                               Padding(
//                                   padding: EdgeInsets.all(5.0),
//                                   child: Container(
//                                     height: 400,
//                                     child: StoryView(
//                                       storyItems: model.stories.length > 0
//                                           ? model.stories
//                                           : [
//                                               model.StoryItemCyrillic(
//                                                   'Жишээ хуудас 1',
//                                                   '',
//                                                   '',
//                                                   Colors.blue)
//                                             ],
//                                       controller: model.storyController,
//                                     ),
//                                   )),
//                             ],
//                           ))
//                         : Container(),
//                     model.activeTab == 'story' && model.activeStory > 0
//                         ? Expanded(
//                             child: Container(
//                               height: 400,
//                               decoration: BoxDecoration(
//                                   color: Colors.green,
//                                   borderRadius: BorderRadius.circular(0)),
//                             ),
//                           )
//                         : Container(),
//                     model.activeTab == 'album' && model.activeAlbum >= 0
//                         ? Expanded(
//                             child: Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 model.activeAlbum == 0
//                                     ? model.renderHome()
//                                     : model.renderPages(model.activeAlbum),
//                                 model.activeTab == 'album' &&
//                                         model.activeAlbum >= 0 &&
//                                         model.activeAction == 'position'
//                                     ? Container(
//                                         color: Colors.black38.withOpacity(0.3),
//                                         padding: new EdgeInsets.only(
//                                           left: ScreenUtil().setWidth(60),
//                                           right: ScreenUtil().setWidth(60),
//                                           top: ScreenUtil().setWidth(20),
//                                           bottom: ScreenUtil().setWidth(20),
//                                         ),
//                                         child: Wrap(
//                                           children: model.albumLayouts
//                                               .map((item) => InkWell(
//                                                     onTap: () {
//                                                       print(
//                                                           'tap on layout combo...${item}');
//                                                       var index = model
//                                                           .albumLayouts
//                                                           .indexOf(item);
//                                                       model.albumSet_Layout(
//                                                           index);
//                                                       model.albumSet_Element(
//                                                           'position');
//                                                     },
//                                                     child: Card(
//                                                         child: Container(
//                                                             alignment: Alignment
//                                                                 .center,
//                                                             decoration: BoxDecoration(
//                                                                 border: Border.all(
//                                                                     color: Colors
//                                                                         .grey)),
//                                                             height: 60,
//                                                             width: 120,
//                                                             child: Text(item))),
//                                                   ))
//                                               .toList()
//                                               .cast<Widget>(),
//                                         ),
//                                       )
//                                     : Container(),
//                                 model.activeTab == 'album' &&
//                                         model.activeAlbum >= 0 &&
//                                         model.activeAction == 'background'
//                                     ? Container(
//                                         color: Colors.black38.withOpacity(0.3),
//                                         padding: new EdgeInsets.only(
//                                             left: ScreenUtil().setWidth(60),
//                                             right: ScreenUtil().setWidth(60)),
//                                         child: Wrap(
//                                           children: model.images
//                                               .map((item) => InkWell(
//                                                     onTap: () {
//                                                       print(
//                                                           'tap on image combo...${item}');
//                                                       print(
//                                                           'width = ${item.originalWidth} , height = ${item.originalHeight}');
//                                                       var index = model.images
//                                                           .indexOf(item);
//                                                       model
//                                                           .pageImgChoose(index);
//                                                       model.albumSet_Element(
//                                                           'background');
//                                                     },
//                                                     child: Card(
//                                                         child: item.originalHeight >=
//                                                                 item.originalWidth
//                                                             ? Container(
//                                                                 height: 60,
//                                                                 width: 40,
//                                                                 child:
//                                                                     AssetThumb(
//                                                                   height: 60,
//                                                                   width: 40,
//                                                                   asset: item,
//                                                                 ),
//                                                               )
//                                                             : Container(
//                                                                 height: 60,
//                                                                 width: 90,
//                                                                 child:
//                                                                     AssetThumb(
//                                                                   asset: item,
//                                                                   height: 60,
//                                                                   width: 90,
//                                                                 ),
//                                                               )),
//                                                   ))
//                                               .toList()
//                                               .cast<Widget>(),
//                                         ),
//                                       )
//                                     : Container(),
//                                 model.activeTab == 'album' &&
//                                         model.activeAlbum >= 0 &&
//                                         model.activeAction == 'text'
//                                     ? Container(
//                                         color: Colors.black38.withOpacity(0.3),
//                                         padding: new EdgeInsets.only(
//                                             left: ScreenUtil().setWidth(60),
//                                             right: ScreenUtil().setWidth(60)),
//                                         child: ListView(
//                                           padding: EdgeInsets.only(top: 30),
//                                           scrollDirection: Axis.vertical,
//                                           //mainAxisAlignment: MainAxisAlignment.center,
//                                           children: [
//                                             model.activeTab == 'album' &&
//                                                     model.activeAlbum > 0 &&
//                                                     model.activeAction == 'text'
//                                                 ? Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .center,
//                                                     children: [
//                                                       Align(
//                                                         child: Container(
//                                                           padding: EdgeInsets.only(
//                                                               right:
//                                                                   ScreenUtil()
//                                                                       .setWidth(
//                                                                           10)),
//                                                           width: ScreenUtil()
//                                                               .setWidth(90),
//                                                           child: new FlatButton(
//                                                             color:
//                                                                 model.activePageImage ==
//                                                                         0
//                                                                     ? Colors
//                                                                         .blue
//                                                                     : Colors
//                                                                         .white,
//                                                             child: Text('1',
//                                                                 style: TextStyle(
//                                                                     fontSize: ScreenUtil()
//                                                                         .setSp(
//                                                                             30))),
//                                                             onPressed: () {
//                                                               model
//                                                                   .pageImgActivate(
//                                                                       0);
//                                                             },
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       Align(
//                                                         child: Container(
//                                                           padding: EdgeInsets.only(
//                                                               right:
//                                                                   ScreenUtil()
//                                                                       .setWidth(
//                                                                           10)),
//                                                           width: ScreenUtil()
//                                                               .setWidth(90),
//                                                           child: new FlatButton(
//                                                             color:
//                                                                 model.activePageImage ==
//                                                                         1
//                                                                     ? Colors
//                                                                         .blue
//                                                                     : Colors
//                                                                         .white,
//                                                             child: Text('2',
//                                                                 style: TextStyle(
//                                                                     fontSize: ScreenUtil()
//                                                                         .setSp(
//                                                                             30))),
//                                                             onPressed: () {
//                                                               model
//                                                                   .pageImgActivate(
//                                                                       1);
//                                                             },
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       Align(
//                                                         child: Container(
//                                                           padding: EdgeInsets.only(
//                                                               right:
//                                                                   ScreenUtil()
//                                                                       .setWidth(
//                                                                           10)),
//                                                           width: ScreenUtil()
//                                                               .setWidth(90),
//                                                           child: new FlatButton(
//                                                             color:
//                                                                 model.activePageImage ==
//                                                                         2
//                                                                     ? Colors
//                                                                         .blue
//                                                                     : Colors
//                                                                         .white,
//                                                             child: Text('3',
//                                                                 style: TextStyle(
//                                                                     fontSize: ScreenUtil()
//                                                                         .setSp(
//                                                                             30))),
//                                                             onPressed: () {
//                                                               model
//                                                                   .pageImgActivate(
//                                                                       2);
//                                                             },
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       model
//                                                                   .albumPages[model
//                                                                       .activeAlbum]
//                                                                   .layouts[0] ==
//                                                               4
//                                                           ? Align(
//                                                               child: Container(
//                                                                 padding: EdgeInsets.only(
//                                                                     right: ScreenUtil()
//                                                                         .setWidth(
//                                                                             10)),
//                                                                 width:
//                                                                     ScreenUtil()
//                                                                         .setWidth(
//                                                                             90),
//                                                                 child:
//                                                                     new FlatButton(
//                                                                   color: model.activePageImage ==
//                                                                           3
//                                                                       ? Colors
//                                                                           .blue
//                                                                       : Colors
//                                                                           .white,
//                                                                   child: Text(
//                                                                       '4',
//                                                                       style: TextStyle(
//                                                                           fontSize:
//                                                                               ScreenUtil().setSp(30))),
//                                                                   onPressed:
//                                                                       () {
//                                                                     model
//                                                                         .pageImgActivate(
//                                                                             3);
//                                                                   },
//                                                                 ),
//                                                               ),
//                                                             )
//                                                           : Container(),
//                                                     ],
//                                                   )
//                                                 : Container(),
//                                             model.activeTab == 'album' &&
//                                                     model.activeAlbum == 0 &&
//                                                     model.activeAction == 'text'
//                                                 ? Padding(
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             5.0),
//                                                     child: new Card(
//                                                       child: new ListTile(
//                                                         leading: new Icon(
//                                                             Icons.account_box),
//                                                         title: new TextField(
//                                                           controller: model
//                                                               .textController,
//                                                           decoration:
//                                                               new InputDecoration(
//                                                                   hintText:
//                                                                       'Зургийн цомгийн нэр',
//                                                                   border:
//                                                                       InputBorder
//                                                                           .none),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   )
//                                                 : Container(),
//                                             Padding(
//                                               padding: const EdgeInsets.all(5),
//                                               child: new Card(
//                                                 child: new ListTile(
//                                                   leading:
//                                                       new Icon(Icons.notes),
//                                                   title: new TextField(
//                                                     maxLines: 4,
//                                                     controller: model
//                                                         .albumTextcontroller,
//                                                     decoration: new InputDecoration(
//                                                         hintText: model
//                                                                     .activeAlbum ==
//                                                                 0
//                                                             ? 'Цомгийн дэлгэрэнгүй тайлбар'
//                                                             : 'Зурагны оронд ТЕКСТ \n(Зураг ба үйл явдлын тайлбар,\nнамтар, түүх)',
//                                                         border:
//                                                             InputBorder.none),
//                                                     //onChanged: model.onAlbumTextChanged,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             Align(
//                                               child: Container(
//                                                 color: Colors.white,
//                                                 width: 100,
//                                                 child: new IconButton(
//                                                   color: Colors.blue,
//                                                   icon: new Icon(Icons.check),
//                                                   onPressed: () {
//                                                     model.onAlbumTextChanged();
//                                                   },
//                                                 ),
//
//                                                 /*    color: Colors.white,
//                                         child: new Icon(Icons.check),
//                                         onPressed: () {
//                                           model.onAlbumTextChanged();
//                                         },
//                                       ),*/
//                                               ),
//                                             ),
//                                           ],
//                                         ))
//                                     : Container(),
//                               ],
//                             ),
//                           )
//                         : Container(),
//                     Column(
//                       // Second row buttons
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         model.activeTab == 'tag' &&
//                                 model.searchPeople.length > 0
//                             ? Container(
//                                 color: Colors.grey[200],
//                                 height: ScreenUtil().setHeight(300),
//                                 child: new ListView.builder(
//                                   itemCount: model.searchPeople.length,
//                                   itemBuilder: (context, i) {
//                                     return new Card(
//                                       color: Colors.grey[200],
//                                       child: new ListTile(
//                                         leading: new CircleAvatar(
//                                           backgroundImage: new NetworkImage(
//                                             model.searchPeople[i]['img_name'],
//                                           ),
//                                         ),
//                                         title: new Text(model.searchPeople[i]
//                                                 ['fname'] +
//                                             ' ' +
//                                             model.searchPeople[i]['name']),
//                                         trailing: new IconButton(
//                                           icon: new Icon(Icons.arrow_upward),
//                                           onPressed: () {
//                                             model.onTagClickPerson(i);
//                                           },
//                                         ),
//                                       ),
//                                       margin: const EdgeInsets.all(0.0),
//                                     );
//                                   },
//                                 ),
//                               )
//                             : Container(),
//                         model.activeTab == 'tag'
//                             ? Container(
//                                 color: Colors.grey[200],
//                                 child: new Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: new Card(
//                                     child: new ListTile(
//                                       leading: new Icon(Icons.search),
//                                       title: new TextField(
//                                         controller: model.searchController,
//                                         decoration: new InputDecoration(
//                                             hintText: 'Тэмдэглэх хүнээ хайх',
//                                             border: InputBorder.none),
//                                         onChanged: model.onSearchTextChanged,
//                                       ),
//                                       trailing: new IconButton(
//                                         icon: new Icon(Icons.cancel),
//                                         onPressed: () {
//                                           model.searchController.clear();
//                                           model.onSearchTextChanged('');
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             : Container(),
//                         // Зурдаг хэсэг бна
//                         model.activeTab == 'text' && model.selectKeyboard[3]
//                             ? Container(
//                                 height: ScreenUtil()
//                                     .setHeight(model.sketchHeight - 52),
//                                 child: model.rightPosiotion
//                                     ? Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: <Widget>[
//                                           SketchPad(model),
//                                           Expanded(
//                                             flex: 1,
//                                             child: Column(
//                                               children: <Widget>[
//                                                 Expanded(
//                                                   child: Container(
//                                                     height: ScreenUtil()
//                                                         .setHeight(
//                                                             model.sketchHeight -
//                                                                 52),
//                                                     child: gestureDetectorRight(
//                                                         context, model),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       )
//                                     : Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: <Widget>[
//                                           Expanded(
//                                             flex: 1,
//                                             child: Column(
//                                               children: <Widget>[
//                                                 Expanded(
//                                                   child: Container(
//                                                     height: ScreenUtil()
//                                                         .setHeight(
//                                                             model.sketchHeight),
//                                                     child: gestureDetectorLeft(
//                                                         context, model),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           SketchPad(model),
//                                         ],
//                                       ))
//                             : Container(),
//                         // Cyrillic text field
//                         model.activeTab == 'text' && model.selectKeyboard[0]
//                             ? Container(
//                                 padding: EdgeInsets.only(
//                                     left: ScreenUtil().setWidth(20),
//                                     right: ScreenUtil().setWidth(20)),
//                                 height: model.selectKeyboard[0]
//                                     ? ScreenUtil().setHeight(150)
//                                     : ScreenUtil().setHeight(150),
//                                 width: ScreenUtil().setWidth(750),
//                                 child: TextField(
//                                   autofocus: true,
//                                   onTap: () {
//                                     //FocusScope.of(context).requestFocus(FocusNode());
//                                     if (model.selectKeyboard[2])
//                                       SystemChannels.textInput
//                                           .invokeMethod('TextInput.hide');
//                                   },
//                                   controller: model.textController,
//                                   textInputAction: TextInputAction.done,
//                                   maxLines: 3,
//                                   decoration: InputDecoration(
//                                       border: InputBorder.none,
//                                       hintText: model.textHint1),
//                                 ),
//                               )
//                             : Container(),
//                         // Galig text field
//                         model.activeTab == 'text' && model.selectKeyboard[1]
//                             ? Container(
//                                 padding: EdgeInsets.only(
//                                     left: ScreenUtil().setWidth(20),
//                                     right: ScreenUtil().setWidth(20)),
//                                 height: model.selectKeyboard[0]
//                                     ? ScreenUtil().setHeight(150)
//                                     : ScreenUtil().setHeight(150),
//                                 width: ScreenUtil().setWidth(750),
//                                 child: TextField(
//                                   autofocus: true,
//                                   onTap: () {
//                                     //FocusScope.of(context).requestFocus(FocusNode());
//                                     if (model.selectKeyboard[2])
//                                       SystemChannels.textInput
//                                           .invokeMethod('TextInput.hide');
//                                   },
//                                   controller: model.galigController,
//                                   textInputAction: TextInputAction.done,
//                                   maxLines: 3,
//                                   decoration: InputDecoration(
//                                       border: InputBorder.none,
//                                       hintText: model.textHint2),
//                                 ),
//                               )
//                             : Container(),
//                         // Mongol text field
//                         (model.activeTab == 'text' && model.selectKeyboard[2])
//                             ? Container(
//                                 height: ScreenUtil().setHeight(890),
//                                 child: Stack(
//                                   children: [
//                                     Positioned(
//                                       child: Container(
//                                         height: ScreenUtil().setHeight(470),
//                                         child: Row(
//                                           children: [
//                                             Expanded(
//                                               child: ListView(
//                                                   scrollDirection:
//                                                       Axis.horizontal,
//                                                   children: <Widget>[
//                                                     MongolText(
//                                                         /*'ᠮᠣᠨᢉᠭᠣᠯ \n ᠮᠣᠨᢉᠭᠣᠯ \n ᠮᠣᠨᢉᠭᠣᠯ \n ᠮᠣᠨᢉᠭᠣᠯ'*/
//                                                         model.tunMongolText,
//                                                         style: TextStyle(
//                                                             fontSize:
//                                                                 ScreenUtil()
//                                                                     .setSp(40),
//                                                             /*fontWeight: FontWeight.w100,*/
//                                                             fontFamily:
//                                                                 'Classical Mongolian Dashtseden'))
//                                                   ]),
//                                             ),
//                                             Container(
//                                               width: ScreenUtil().setWidth(210),
//                                               decoration: BoxDecoration(
//                                                   border: Border(
//                                                       right: BorderSide(
//                                                           width: 2,
//                                                           color: Colors
//                                                               .blue[800]))),
//                                               margin: EdgeInsets.only(
//                                                 right:
//                                                     ScreenUtil().setWidth(50),
//                                               ),
//                                               // color: Colors.white,
//                                               child: RotatedBox(
//                                                 quarterTurns: 1,
//                                                 child: TextField(
//                                                   autofocus: true,
//                                                   focusNode: model.myFocusNode,
//                                                   maxLines: 20,
//                                                   controller: model
//                                                       .mongolTextcontroller,
//                                                   decoration: InputDecoration(
//                                                       focusColor: Colors.blue,
//                                                       hintText: 'ᠪᠢᠴᢉᠦ'),
//                                                   style: TextStyle(
//                                                     fontFamily:
//                                                         "Classical Mongolian Dashtseden",
//                                                     fontSize:
//                                                         ScreenUtil().setSp(40),
//                                                   ),
//                                                   cursorColor: Colors.blue,
//                                                   showCursor: true,
//                                                   readOnly: true,
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     /* Container(
//                                         height: 200,
//                                         child: RotatedBox(
//                                           quarterTurns: 1,
//                                           child: TextField(
//                                             controller: model.mongolTextcontroller,
//                                             autofocus: true,
//                                             textAlignVertical:
//                                                 TextAlignVertical.top,
//                                             decoration: InputDecoration(
//                                                 border: OutlineInputBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(3),
//                                                 ),
//                                                 hintText: 'ᠨᠢᠭᠡ ᠬᠣᠶᠠᠷ ᠭᠤᠷᠪᠠ'),
//                                             style: TextStyle(
//                                               //fontFamily: MongolFont.defaultFont,
//                                               fontSize: 24,
//                                             ),
//                                             showCursor: true,
//                                             readOnly: true,
//                                           ),
//                                         ),
//                                       ),*/
//                                     model.dataWordLenght.length != null &&
//                                             model.dataWordLenght.length >= 1 &&
//                                             model
//                                                     .dataWordLenght[model
//                                                             .dataWordLenght
//                                                             .length -
//                                                         1]
//                                                     .length <=
//                                                 1
//                                         ? Positioned(
//                                             bottom:
//                                                 ScreenUtil().setHeight(420) +
//                                                     0.0,
//                                             child:
//                                                 model.listViewTiinText.length !=
//                                                         0
//                                                     ? Container(
//                                                         height: ScreenUtil()
//                                                             .setHeight(120),
//                                                         width: ScreenUtil()
//                                                             .setWidth(350),
//                                                         color: Colors.white,
//                                                         child: ListView.builder(
//                                                           scrollDirection:
//                                                               Axis.horizontal,
//                                                           itemCount: model
//                                                               .listViewTiinText
//                                                               .length,
//                                                           itemBuilder:
//                                                               (BuildContextcontext,
//                                                                   int index) {
//                                                             return Row(
//                                                               children: [
//                                                                 Container(
//                                                                   padding: EdgeInsets.symmetric(
//                                                                       horizontal:
//                                                                           ScreenUtil()
//                                                                               .setWidth(20)),
//                                                                   decoration: BoxDecoration(
//                                                                       border: Border(
//                                                                           right: BorderSide(
//                                                                               width: 1,
//                                                                               color: Colors.black))),
//                                                                   child:
//                                                                       InkWell(
//                                                                     child:
//                                                                         MongolText(
//                                                                       model
//                                                                           .listViewTiinText[
//                                                                               index]
//                                                                           .toString(),
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .black,
//                                                                           fontSize: ScreenUtil().setSp(
//                                                                               30),
//                                                                           fontFamily:
//                                                                               "Classical Mongolian Dashtseden"),
//                                                                     ),
//                                                                     onTap: () {
//                                                                       model
//                                                                           .deleteText();
//                                                                       model.insertText(
//                                                                           model.listViewTiinText[index] +
//                                                                               ' ');
//                                                                       model
//                                                                           .listViewTiinText
//                                                                           .length = 0;
//                                                                       model
//                                                                           .notifyListeners();
//                                                                     },
//                                                                   ),
//                                                                 )
//                                                               ],
//                                                             );
//                                                           },
//                                                         ))
//                                                     : Container(
//                                                         height: 1,
//                                                         width: 1,
//                                                         color: Colors.red),
//                                           )
//                                         : Positioned(
//                                             bottom:
//                                                 ScreenUtil().setHeight(420) +
//                                                     0.0,
//                                             child:
//                                                 model.databaseWordsSee &&
//                                                         model.autoWords
//                                                                 .length !=
//                                                             0
//                                                     ? Container(
//                                                         height: ScreenUtil()
//                                                             .setHeight(120),
//                                                         width: ScreenUtil()
//                                                             .setWidth(460),
//                                                         color: Colors.white,
//                                                         child: ListView.builder(
//                                                           scrollDirection:
//                                                               Axis.horizontal,
//                                                           itemCount: model
//                                                               .autoWords.length,
//                                                           itemBuilder:
//                                                               (BuildContextcontext,
//                                                                   int index) {
//                                                             return Row(
//                                                               children: [
//                                                                 Container(
//                                                                   padding: EdgeInsets.symmetric(
//                                                                       horizontal:
//                                                                           ScreenUtil()
//                                                                               .setWidth(20)),
//                                                                   decoration: BoxDecoration(
//                                                                       border: Border(
//                                                                           right: BorderSide(
//                                                                               width: 1,
//                                                                               color: Colors.black))),
//                                                                   child:
//                                                                       InkWell(
//                                                                     child:
//                                                                         MongolText(
//                                                                       model
//                                                                           .autoWords[
//                                                                               index]
//                                                                               [
//                                                                               'tuntxt']
//                                                                           .toString(),
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .black,
//                                                                           fontSize: ScreenUtil().setSp(
//                                                                               30),
//                                                                           fontFamily:
//                                                                               "Classical Mongolian Dashtseden"),
//                                                                     ),
//                                                                     onTap: () {
// /*                                                      model
//                                                           .deleteText();
//                                                       */
//                                                                       for (int i =
//                                                                               0;
//                                                                           i < model.dataWordLenght[model.dataWordLenght.length - 1].length;
//                                                                           i++) {
//                                                                         model
//                                                                             .deleteText();
//                                                                       }
//                                                                       model.insertText(
//                                                                           model.autoWords[index]['tuntxt'] +
//                                                                               ' ');
//                                                                       model.databaseWordsSee =
//                                                                           false;
//                                                                       model
//                                                                           .notifyListeners();
//                                                                     },
//                                                                   ),
//                                                                 )
//                                                               ],
//                                                             );
//                                                           },
//                                                         ))
//                                                     : Container(),
//                                           ),
//                                     Positioned(
//                                       bottom: 0.0,
//                                       child: Container(
//                                         height: ScreenUtil().setHeight(425),
//                                         color: Colors.grey[200],
//                                         child: VirtualKeyboard(
//                                           height: ScreenUtil().setHeight(425),
//                                           mon: model.vkey_isNumericMode
//                                               ? false
//                                               : (model.vkey_isMongol
//                                                   ? true
//                                                   : true),
//                                           //textColor: Colors.black,
//                                           type: model.vkey_isNumericMode
//                                               ? VirtualKeyboardType.Numeric
//                                               : (model.vkey_isMongol
//                                                   ? VirtualKeyboardType
//                                                       .Alphanumeric
//                                                   : VirtualKeyboardType.Mons),
//                                           onKeyPress: model.onKeyPress,
//                                           onLongKeyPress: model.onKeyLongPress,
//                                         ),
//                                       ),
//                                     ),
//                                     model.clear ? model.action1 : Container(),
//                                   ],
//                                 ),
//                               )
//                             : Container(),
//                         // Mon Cyr Monbichig Keyboard SELECT row
//                         model.activeTab == 'text'
//                             ? Container(
//                                 padding: EdgeInsets.all(0.0),
//                                 margin: EdgeInsets.all(0.0),
//                                 color: Colors.white,
//                                 child: ToggleButtons(
//                                   borderWidth: 0.01,
//                                   borderColor: Colors.white,
//                                   color: Colors.grey,
//                                   fillColor: Colors.transparent,
//                                   selectedColor: Colors.blue,
//                                   children: <Widget>[
//                                     Container(
//                                         decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 color: Colors.grey[200])),
//                                         width: ScreenUtil().setWidth(180),
//                                         child: Center(
//                                           child: Text('АБВГ',
//                                               style: TextStyle(
//                                                 fontSize:
//                                                     ScreenUtil().setSp(26),
//                                               )),
//                                         )),
//                                     Container(
//                                         width: ScreenUtil().setWidth(180),
//                                         decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 color: Colors.grey[200])),
//                                         child: Center(
//                                             child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: <Widget>[
//                                             Text('АБВГ ->',
//                                                 style: TextStyle(
//                                                   fontSize:
//                                                       ScreenUtil().setSp(26),
//                                                 )),
//                                             MongolText('ᠮᠣᠨᢉᠭᠣᠯ',
//                                                 style: TextStyle(
//                                                     fontSize:
//                                                         ScreenUtil().setSp(20),
//                                                     /*fontWeight: FontWeight.w100,*/
//                                                     fontFamily:
//                                                         'MongolianScript')),
//                                           ],
//                                         ))),
//                                     Container(
//                                         width: ScreenUtil().setWidth(180),
//                                         decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 color: Colors.grey[200])),
//                                         child: Center(
//                                           child: MongolText('ᠮᠣᠨᢉᠭᠣᠯ \n ᠭᠠᠷ',
//                                               style: TextStyle(
//                                                   fontSize:
//                                                       ScreenUtil().setSp(20),
//                                                   /*fontWeight: FontWeight.w100,*/
//                                                   fontFamily:
//                                                       'MongolianScript')),
//                                         )),
//                                     Container(
//                                         width: ScreenUtil().setWidth(180),
//                                         decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 color: Colors.grey[200])),
//                                         child: Center(
//                                           child: MongolText('ᠮᠣᠨᢉᠭᠣᠯ\n ᠪᠢᠴᠢᠮᠡᠯ',
//                                               style: TextStyle(
//                                                   fontSize:
//                                                       ScreenUtil().setSp(20),
//                                                   /*fontWeight: FontWeight.w100,*/
//                                                   fontFamily:
//                                                       'Classical Mongolian Dashtseden')),
//                                         )),
//                                   ],
//                                   isSelected: model.selectKeyboard,
//                                   onPressed: (int index) {
//                                     model.toggleButtonValueChange(
//                                         index, context);
//                                   },
//                                 ),
//                               )
//                             : Container(),
//                         // STORY page numbers
//                         model.activeTab == 'story'
//                             ? Container(
//                                 //width: ScreenUtil().setWidth(750),
//                                 height: 60,
//                                 padding: EdgeInsets.only(left: 7, right: 7),
//                                 color: Colors.white,
//                                 child: ListTile(
//                                   title: ListView.builder(
//                                     scrollDirection: Axis.horizontal,
//                                     //physics: const NeverScrollableScrollPhysics(),
//                                     //controller: model.scrollController,
//                                     itemCount: model.storyPages.length,
//                                     itemBuilder: (context, index) {
//                                       return SizedBox(
//                                           height: 45,
//                                           width: 45,
//                                           child: RaisedButton(
//                                             padding: EdgeInsets.only(
//                                                 left: 0, right: 0),
//                                             elevation: 0,
//                                             color:
//                                                 model.activeStory == (index + 1)
//                                                     ? Colors.blue
//                                                     : Colors.white,
//                                             onPressed: () {
//                                               //model.changeTab('text');
//                                               model.storyActivate(index + 1);
//                                               print('Text onpressed!!!!!');
//                                             },
//                                             child: Text(
//                                                 '' + (index + 1).toString(),
//                                                 style: TextStyle(
//                                                   color: model.activeStory ==
//                                                           (index + 1)
//                                                       ? Colors.white
//                                                       : Colors.grey[400],
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize:
//                                                       ScreenUtil().setSp(40),
//                                                 )),
//                                           ));
//                                     },
//                                   ),
//                                   onTap: null,
//                                   trailing: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       SizedBox(
//                                         width: 45,
//                                         child: RaisedButton(
//                                           padding: EdgeInsets.only(
//                                               left: 0, right: 0),
//                                           elevation: 0,
//                                           color: model.activeStory == -1
//                                               ? Colors.blue
//                                               : Colors.white,
//                                           onPressed: () {
//                                             //model.changeTab('text');
//                                             model.storyActivate(-1);
//                                             print('Text onpressed!!!!!');
//                                           },
//                                           child: Icon(
//                                             Icons.play_arrow,
//                                             color: model.activeStory == -1
//                                                 ? Colors.white
//                                                 : Colors.grey,
//                                             size: ScreenUtil().setSp(40),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 45,
//                                         child: RaisedButton(
//                                           elevation: 0,
//                                           color: model.activeTab == 'story'
//                                               ? Colors.white
//                                               : Colors.white,
//                                           onPressed: () {
//                                             //model.changeTab('text');
//                                             model.add_story();
//                                             print('Add story onpressed!!!!!');
//                                           },
//                                           child: Text('+',
//                                               style: TextStyle(
//                                                 color: Colors.blue,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize:
//                                                     ScreenUtil().setSp(50),
//                                               )),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ))
//                             : Container(),
//                         model.activeTab == 'album' &&
//                                 model.activeAction != 'text'
//                             ? Container(
//                                 //width: ScreenUtil().setWidth(750),
//                                 height: 60,
//                                 padding: EdgeInsets.only(left: 7, right: 7),
//                                 color: Colors.white,
//                                 child: ListTile(
//                                   title: ListView.builder(
//                                     scrollDirection: Axis.horizontal,
//                                     //physics: const NeverScrollableScrollPhysics(),
//                                     //controller: model.scrollController,
//                                     itemCount: model.albumPages.length,
//                                     itemBuilder: (context, index) {
//                                       return SizedBox(
//                                           height: 45,
//                                           width: index == 0 ? 90 : 45,
//                                           child: RaisedButton(
//                                             padding: EdgeInsets.only(
//                                                 left: 0, right: 0),
//                                             elevation: 0,
//                                             color: model.activeAlbum == index
//                                                 ? Colors.blue
//                                                 : Colors.white,
//                                             onPressed: () {
//                                               //model.changeTab('text');
//                                               model.albumActivate(index);
//                                               print('Text onpressed!!!!!');
//                                             },
//                                             child: Text(
//                                                 index == 0
//                                                     ? 'Цомог нүүр'
//                                                     : '' + (index).toString(),
//                                                 style: TextStyle(
//                                                   color:
//                                                       model.activeAlbum == index
//                                                           ? Colors.white
//                                                           : Colors.grey[400],
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: ScreenUtil().setSp(
//                                                       index == 0 ? 26 : 40),
//                                                 )),
//                                           ));
//                                     },
//                                   ),
//                                   onTap: null,
//                                   trailing: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       SizedBox(
//                                         width: 45,
//                                         child: RaisedButton(
//                                           elevation: 0,
//                                           color: model.activeTab == 'album'
//                                               ? Colors.white
//                                               : Colors.white,
//                                           onPressed: () {
//                                             //model.changeTab('text');
//                                             model.add_album();
//                                             print('Add album onpressed!!!!!');
//                                           },
//                                           child: Text('+',
//                                               style: TextStyle(
//                                                 color: Colors.blue,
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize:
//                                                     ScreenUtil().setSp(50),
//                                               )),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 45,
//                                         child: RaisedButton(
//                                           elevation: 0,
//                                           color: model.activeTab == 'album'
//                                               ? Colors.white
//                                               : Colors.white,
//                                           onPressed: () {
//                                             //model.changeTab('text');
//                                             model.del_album_page(
//                                                 model.activeAlbum);
//                                             print('Add album onpressed!!!!!');
//                                           },
//                                           child: Icon(
//                                             Icons.delete,
//                                             color: model.activeAlbum > 0
//                                                 ? Colors.deepOrange
//                                                 : Colors.grey,
//                                             size: ScreenUtil().setSp(40),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ))
//                             : Container(),
//                         // Icon button ROW
//                         model.selectKeyboard[3] || model.selectKeyboard[2]
//                             ? Container()
//                             : Container(
//                                 padding: EdgeInsets.only(left: 7, right: 7),
//                                 color: Colors.white,
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   children: <Widget>[
//                                     curUser.post_upload_purpose != 4
//                                         ? Expanded(
//                                             child: RaisedButton(
//                                               elevation: 0,
//                                               color: model.activeTab == 'text'
//                                                   ? Colors.blue
//                                                   : Colors.white,
//                                               onPressed: () {
//                                                 model.changeTab('text');
//                                                 print('Text onpressed!!!!!');
//                                               },
//                                               child: Icon(
//                                                 Icons.text_fields,
//                                                 color: model.activeTab == 'text'
//                                                     ? Colors.white
//                                                     : Colors.grey,
//                                                 size: ScreenUtil().setSp(40),
//                                               ),
//                                             ),
//                                           )
//                                         : Container(),
//                                     // Text
//                                     curUser.post_upload_purpose != 3
//                                         ? Expanded(
//                                             child: RaisedButton(
//                                               elevation: 0,
//                                               color: model.activeTab == 'image'
//                                                   ? Colors.white
//                                                   : Colors.white,
//                                               onPressed: () {
//                                                 if (curUser
//                                                         .post_upload_purpose ==
//                                                     4) {
//                                                   model.getImage();
//                                                 } else {
//                                                   model.changeTab('image');
//                                                 }
//                                                 //print('camera onpressed! image cnt = ${model.images.length}');
//                                                 //model.getImage();//ImageSource.camera);
//                                               },
//                                               child: Icon(
//                                                 Icons.camera_alt,
//                                                 color:
//                                                     model.activeTab == 'image'
//                                                         ? Colors.blue
//                                                         : Colors.grey,
//                                                 size: ScreenUtil().setSp(40),
//                                               ),
//                                             ),
//                                           )
//                                         : Container(),
//                                     // Image
//                                     /*Expanded(
//                                       child: RaisedButton(
//                                         elevation: 0,
//                                         color: model.activeTab=='image'?Colors.white:Colors.white,
//                                         onPressed: () {
//                                           model.changeTab('image');
//                                           model.getImage(ImageSource.gallery);
//                                         },
//                                         child: Icon(
//                                           Icons.photo,
//                                           color: model.activeTab=='image'?Colors.blue: Colors.grey,
//                                           size: ScreenUtil().setSp(40,
//                                               allowFontScalingSelf: false),
//                                         ),
//                                       ),
//                                     ),*/
//                                     curUser.post_upload_purpose != 4
//                                         ? Expanded(
//                                             child: RaisedButton(
//                                               elevation: 0,
//                                               color: model.activeTab == 'tag'
//                                                   ? Colors.blue
//                                                   : Colors.white,
//                                               onPressed: () {
//                                                 model.changeTab('tag');
//                                                 print('tag onpressed!!!!!');
//                                               },
//                                               child: Icon(
//                                                 Icons.alternate_email,
//                                                 color: model.activeTab == 'tag'
//                                                     ? Colors.white
//                                                     : Colors.grey,
//                                                 size: ScreenUtil().setSp(40),
//                                               ),
//                                             ),
//                                           )
//                                         : Container(),
//                                     // Tag
//                                     curUser.post_upload_purpose != 4
//                                         ? Expanded(
//                                             child: RaisedButton(
//                                               elevation: 0,
//                                               color:
//                                                   model.activeTab == 'milestone'
//                                                       ? Colors.blue
//                                                       : Colors.white,
//                                               onPressed: () {
//                                                 //model.changeTab('milestone');
//                                                 //print('location onpressed!!!!!');
//                                               },
//                                               child: Icon(
//                                                 Icons.event,
//                                                 color: model.activeTab ==
//                                                         'milestone'
//                                                     ? Colors.white
//                                                     : Colors.grey,
//                                                 size: ScreenUtil().setSp(40),
//                                               ),
//                                             ),
//                                           )
//                                         : Container(),
//                                     // Milestone
//                                     /*Expanded(
//                                       child: RaisedButton(
//                                           elevation: 0,
//                                           color: Colors.white,
//                                           onPressed: () {
//                                             //model.changeTab('color');
//                                             print('background color onpressed!!!!!');
//                                           },
//                                           child: model.activeTab=='color'?Image.asset( 'assets/images/colorPinkerIcon.png'):Image.asset( 'assets/images/colorPinkerIcon.png',  color: Colors.grey[300])),
//                                     ), */
//                                     // Color
//                                     curUser.post_upload_purpose != 4
//                                         ? Expanded(
//                                             child: RaisedButton(
//                                               elevation: 0,
//                                               color: model.activeTab == 'story'
//                                                   ? Colors.blue
//                                                   : Colors.white,
//                                               onPressed: () {
//                                                 if (curUser
//                                                         .post_upload_purpose <=
//                                                     1) //model.changeTab('story');
//                                                   print('story onpressed!!!!!');
//                                               },
//                                               child: Icon(
//                                                 Icons.vibration,
//                                                 color:
//                                                     model.activeTab == 'story'
//                                                         ? Colors.white
//                                                         : Colors.grey,
//                                                 size: ScreenUtil().setSp(40),
//                                               ),
//                                             ),
//                                           )
//                                         : Container(),
//                                     curUser.post_upload_purpose >= 2 &&
//                                             curUser.post_upload_purpose < 4
//                                         ? Expanded(
//                                             child: RaisedButton(
//                                               elevation: 0,
//                                               color: model.activeTab == 'album'
//                                                   ? Colors.blue
//                                                   : Colors.white,
//                                               onPressed: () {
//                                                 model.changeTab('album');
//                                                 print('album onpressed!!!!!');
//                                               },
//                                               child: Icon(
//                                                 Icons.account_box,
//                                                 color:
//                                                     model.activeTab == 'album'
//                                                         ? Colors.white
//                                                         : Colors.grey,
//                                                 size: ScreenUtil().setSp(40),
//                                               ),
//                                             ),
//                                           )
//                                         : Container(),
//                                     // Story
//                                   ],
//                                 )),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ));
//   }
// }
