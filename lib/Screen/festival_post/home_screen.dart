import 'package:flutter/material.dart';
import 'package:untitled12/Model/Festival_Data.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({Key? key}) : super(key: key);

  @override
  State<Dashbord> createState() => _DashbordState();
}

class _DashbordState extends State<Dashbord> {
  List festival_name = [
    "Diwali",
    "Navratri",
    "Makarsankrantri",
    "Holi",
    "Janmastmi",
    "Ganesh Chaturthi",
    "Independent Day",
    "Republic Day",
  ];
  List festival_img = [
    "https://images.indianexpress.com/2020/11/diwali-feature-1.jpg",
    "https://img.naidunia.com/naidunia/ndnimg/16102020/16_10_2020-happy_navratri_images_new_20201018_75123.jpg",
    "https://pagalstatus.com/wp-content/webpc-passthru.php?src=https://pagalstatus.com/wp-content/uploads/2022/01/Uttarayan-Whatsapp-Status-Video.jpg&nocache=1",
    "https://c.ndtvimg.com/2021-03/ep5miu58_happy-holi_625x300_29_March_21.jpg?im=FaceCrop,algorithm=dnn,width=1200,height=886",
    "https://images.indianexpress.com/2020/11/diwali-feature-1.jpg",
    "https://images.indianexpress.com/2020/11/diwali-feature-1.jpg",
    "https://images.indianexpress.com/2020/11/diwali-feature-1.jpg",
    "https://images.indianexpress.com/2020/11/diwali-feature-1.jpg"
  ];

  List diwali = [
    "https://images.indianexpress.com/2020/11/diwali-feature-1.jpg",
    "https://images.indianexpress.com/2020/11/diwali-feature-1.jpg",
    "https://images.indianexpress.com/2020/11/diwali-feature-1.jpg",
    "https://images.indianexpress.com/2020/11/diwali-feature-1.jpg",
  ];

  List navratri = [
    "https://img.naidunia.com/naidunia/ndnimg/16102020/16_10_2020-happy_navratri_images_new_20201018_75123.jpg",
    "https://img.naidunia.com/naidunia/ndnimg/16102020/16_10_2020-happy_navratri_images_new_20201018_75123.jpg",
    "https://img.naidunia.com/naidunia/ndnimg/16102020/16_10_2020-happy_navratri_images_new_20201018_75123.jpg",
    "https://img.naidunia.com/naidunia/ndnimg/16102020/16_10_2020-happy_navratri_images_new_20201018_75123.jpg",
    "https://img.naidunia.com/naidunia/ndnimg/16102020/16_10_2020-happy_navratri_images_new_20201018_75123.jpg",
  ];

  List FestivalList = [];
  List finallist =[];

  @override
  void initState() {
    super.initState();

    FestivalList.addAll([diwali,navratri,diwali,navratri,diwali,navratri,diwali,navratri]);


    for (int i = 0; i < festival_name.length; i++) {
      FestivalData festivalData= FestivalData(festival_name[i], FestivalList[i]);
      finallist.add(festivalData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("BrandPost"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: GridView.builder(
          itemCount: festival_name.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "selectimg",arguments: finallist[index]);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          festival_img[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(festival_name[index]),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
