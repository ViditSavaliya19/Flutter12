import 'package:flutter/material.dart';
import 'package:stickereditor/stickereditor.dart';

class Sticker_Screen extends StatefulWidget {
  const Sticker_Screen({Key? key}) : super(key: key);

  @override
  State<Sticker_Screen> createState() => _Sticker_ScreenState();
}

class _Sticker_ScreenState extends State<Sticker_Screen> {

  List<String> fontlist=["lr","lr","lr","lr","lr"];
  List<Color> colorlist=[Colors.red,Colors.blue,Colors.yellow,Colors.pink];
  List<String> stickerlist =["asstes/images/dice1.png","asstes/images/dice2.png","asstes/images/dice3.png","asstes/images/dice4.png","asstes/images/dice5.png"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: StickerEditingView(
            isnetwork: false,
            height: 300,
            width: 300,
            imgUrl: "assets/images/img.jpeg",
            fonts: fontlist,
            palletColor: colorlist,
            assetList: stickerlist,
          ),
        ),
      ),
    );
  }
}
