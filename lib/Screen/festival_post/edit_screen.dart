import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';

class EditScreen extends StatefulWidget{
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> with WidgetsBindingObserver{
  ImagePicker _imagePicker = ImagePicker();
  File file = File("");
  TextEditingController txt_name = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController mobile_controller = TextEditingController();
  TextEditingController address_controller = TextEditingController();
  String comapnyname = " ";

  Color pikcolor = Color(0xffFF0000);

  GlobalKey key = GlobalKey();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didUpdateWidget(covariant EditScreen oldWidget) {
    WidgetsBinding.instance!.addObserver(this);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);
  }
  @override
  Widget build(BuildContext context) {
    String link = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Post"),
          centerTitle: true,
          backgroundColor: Colors.red,
          actions: [
            IconButton(
              onPressed: () {
                saveImage();
              },
              icon: Icon(Icons.check),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            RepaintBoundary(
              key: key,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 400,
                    width: 400,
                    child: Image.network(
                      link,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                      height: 400,
                      width: 400,
                      alignment: Alignment.topRight,
                      child: Container(
                          margin: EdgeInsets.all(5),
                          height: 50,
                          width: 50,
                          child: Image.file(file))),
                  Container(
                      height: 400,
                      width: 400,
                      padding: EdgeInsets.only(top: 30),
                      alignment: Alignment.topCenter,
                      child: Text(
                        "${comapnyname}",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  Container(
                    height: 400,
                    // padding: EdgeInsets.all(20),
                    width: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          color: Colors.blue,
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.mail,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${email_controller.text}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${mobile_controller.text}",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(5),
                            width: double.infinity,
                            alignment: Alignment.center,
                            color: pikcolor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.where_to_vote,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "${address_controller.text}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              height: 100,
            )),
            Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          print("Hello ----------  ");
                          XFile? f1 = await _imagePicker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {
                            file = File(f1!.path);
                          });
                        },
                        child: Icon(
                          Icons.add_a_photo,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Add Logo"),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      TextDialog();
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.format_color_text,
                          color: Colors.black,
                          size: 30,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Add Text"),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      bgColor();
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.invert_colors,
                          color: Colors.black,
                          size: 30,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Color"),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.donut_large,
                        color: Colors.black,
                        size: 30,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Add Sticker"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void TextDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              Column(
                children: [
                  TextField(
                    controller: txt_name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Comapny Name"),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: email_controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Email Name"),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: mobile_controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Mobile"),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: address_controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Address"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        comapnyname = txt_name.text.toString();
                        Navigator.pop(context);
                      });
                    },
                    child: Text("ADD"),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                  ),
                ],
              ),
            ],
          );
        });
  }

  void bgColor() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              ColorPicker(
                pickerColor: pikcolor,
                onColorChanged: (color) {
                  setState(() {
                    pikcolor = color;
                  });
                },
              ),
            ],
          );
        });
  }

  void saveImage()async
  {
    // Widget to image Convert
    RenderRepaintBoundary boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image= await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    var unitByte =  byteData!.buffer.asUint8List();

    //save code
    var dr =  (await getApplicationDocumentsDirectory()).path;
    File f1 = File("$dr/photo123.png");
    print("========  ${f1.path}");
    
    f1.writeAsBytes(unitByte);
  }
}
