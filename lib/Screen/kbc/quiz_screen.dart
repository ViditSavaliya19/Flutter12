import 'package:flutter/material.dart';

class QuizKBC extends StatefulWidget {
  const QuizKBC({Key? key}) : super(key: key);

  @override
  State<QuizKBC> createState() => _QuizKBCState();
}

class _QuizKBCState extends State<QuizKBC> {
  List QA = [
    "Who is PM of india",
    "Which is National bird",
    "Who is founder of C",
    "Parent Company of Flutter"
  ];
  List A = ["Manmohan Singh", "Tiger", "Denish Ritchi", "Google"];
  List B = ["Nmo", "Lion", "Mark", "Apple"];
  List C = ["Rahul Gandhi", "Peacock", "Larry page", "Microsoft"];
  List D = ["Lauprasad", "Sperow", "Steave jobs", "Reliance"];

  List Answer = ["B", "C", "A", "A"];

  List user_answer = ["", "", "", ""];

  int i = 0;
  int total_point = 4;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.history,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    i = 0;
                  });
                  total_point=4;
                },
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                onPressed: () {
                  FinalResult();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text(
                                  total_point<2?"looser $total_point":"Winner $total_point",
                                  style:
                                      TextStyle(color: Colors.red, fontSize: 30),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Image.network(
                                      "https://i.pinimg.com/736x/4a/08/30/4a083000a80262e2ccd897a6f7bfbd36.jpg"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                height: 300,
                alignment: Alignment.center,
                child: Text(
                  "${QA[i]}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (i < 3) {
                      user_answer[i] = "A";
                      setState(() {
                        i++;
                      });
                    }
                  },
                  child: Text(
                    "A. ${A[i]}",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.amber),
                ),
                SizedBox(
                  width: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (i < 3) {
                      user_answer[i] = "B";
                      setState(() {
                        i++;
                      });
                    }
                  },
                  child: Text(
                    "B. ${B[i]}",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.amber),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (i < 3) {
                      user_answer[i] = "C";
                      setState(() {
                        i++;
                      });
                    }
                  },
                  child: Text(
                    "C. ${C[i]}",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.amber),
                ),
                SizedBox(
                  width: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (i < 3) {
                      user_answer[i] = "D";
                      setState(() {
                        i++;
                      });
                    }
                  },
                  child: Text(
                    "D. ${D[i]}",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.amber),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  void FinalResult() {
    for (int j = 0; j < 4; j++) {
      if (Answer[j] != user_answer[j]) {
        total_point--;
      }
    }
  }
}
