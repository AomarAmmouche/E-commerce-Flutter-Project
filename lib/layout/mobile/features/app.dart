import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final list = ["Shoes", "Car", "laptop", "Mobile", "Clothes"];
  final List<bool> selectedItems = [false, false, false];
  bool get selected1 => selectedItems[0];
  bool get selected2 => selectedItems[1];
  bool get selected3 => selectedItems[2];
    String img1 = "https://images.pexels.com/photos/7248317/pexels-photo-7248317.jpeg";
    String img2 = "https://images.pexels.com/photos/19892485/pexels-photo-19892485.jpeg";
    String img3 = "https://images.pexels.com/photos/29965273/pexels-photo-29965273.jpeg";
    List<String> get images => [img1, img2, img3];
    late String imgUrl = images[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "shopping",
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.w700,
          ),
        ),
        actionsPadding: EdgeInsets.all(8),
        actions: [
          Icon(Icons.search),

          SizedBox(width: 10),
          Icon(Icons.person),
          SizedBox(width: 10),
          Icon(Icons.store),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            //product card
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.grey.shade100, Colors.grey.shade200],
                ),
              ),
              child: Stack(
                children: [
                  
                  Positioned(
                    child: ClipRRect(
                     clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        opacity: const AlwaysStoppedAnimation<double>(0.9),
                        imgUrl,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 12,
                    left: 100,
                    right: 90,
                    child: Row(
                      spacing: 16,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedItems[0] = !selectedItems[0];
                              imgUrl = images[0];
                              if (selectedItems[0]) {
                                selectedItems[1] = false;
                                selectedItems[2] = false;
                              } else {
                                print("not selected 1");
                              }
                            });
                            // index 1 2 3    
                          },
                          child: chipper(isSelected: selected1)),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedItems[1] = !selectedItems[1];
                              imgUrl = images[1];
                              if (selectedItems[1]) {
                                   selectedItems[0] = false;
                                   selectedItems[2] = false;
                                } else {
                                print("not selected 2");
                              }
                            });
                          },
                          child: chipper(isSelected: selected2)),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedItems[2] = !selectedItems[2];
                              imgUrl = images[2];
                              if (selectedItems[2]) {
                                imgUrl = images[2];
                                   selectedItems[0] = false;
                                   selectedItems[1] = false;
                                } else {
                                print("not selected 3");
                              }
                            });
                          },
                          child: chipper(isSelected: selected3)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.black),

                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Clothes", textAlign: TextAlign.start),
                  Row(
                    spacing: 20,
                    children: [
                      chip(text: "mido"),
                      chip(text: "kilo", isSelected: true),
                      Spacer(),
                      chip(text: "lio"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Icon(Icons.home), Icon(Icons.hearing)],
        ),
      ),
    );
  }
}

class chipper extends StatelessWidget {
  final bool isSelected; //true or false
  const chipper({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: isSelected ? Colors.black : Colors.grey,
    );
  }
}

class chip extends StatelessWidget {
  final String text;
  final bool? isSelected;
  const chip({super.key, required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 4, top: 4),
      decoration: BoxDecoration(
        color: isSelected! ? Colors.blueAccent : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(text),
    );
  }
}
