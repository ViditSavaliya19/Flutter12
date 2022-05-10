import 'package:flutter/material.dart';
import 'package:untitled12/Model/Festival_Data.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    FestivalData l1 =
        ModalRoute.of(context)!.settings.arguments as FestivalData;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${l1.name}"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: l1.imgList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'editscreen',arguments: l1.imgList[index]);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 100,
                width: 100,
                child: Image.network(
                  l1.imgList[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
