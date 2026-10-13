import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool selected1 = true;
  bool selected2 = false;
  bool selected3 = false;
  final list = ["mido", "kilo", "lio"];

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
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        height: double.infinity,
                        fit: BoxFit.cover,
                        opacity: const AlwaysStoppedAnimation<double>(0.9),
                        "https://wallpaper.forfun.com/fetch/ca/ca79bf02028cdae577213a790965796b.jpeg?w=1470&r=0.5625&f=webp",
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
                              selected1 = !selected1;
                              if (selected1) {
                                   selected2 = false;
                                   selected3 = false;
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
                              selected2 = !selected2;
                              if (selected2) {
                                   selected1 = false;
                                   selected3 = false;
                                } else {
                                print("not selected 2");
                              }
                            });
                          },
                          child: chipper(isSelected: selected2)),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selected3 = !selected3;
                              if (selected3) {
                                   selected1 = false;
                                   selected2 = false;
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

