import 'package:ecommerce_dashboard/layout/home/data/model/item.dart';
import 'package:flutter/material.dart';
import '../widget/chipper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Item item1 = Item(
    id: "1",
    isSelected: true,
    imageUrl:
        "https://images.pexels.com/photos/7248317/pexels-photo-7248317.jpeg",
  );
  Item item2 = Item(
    id: "2",
    isSelected: false,
    imageUrl:
        "https://images.pexels.com/photos/19892485/pexels-photo-19892485.jpeg",
  );
  Item item3 = Item(
    id: "3",
    isSelected: false,
    imageUrl:
        "https://images.pexels.com/photos/29965273/pexels-photo-29965273.jpeg",
  );
  bool get selected1 => item1.isSelected;
  bool get selected2 => item2.isSelected;
  bool get selected3 => item3.isSelected;
  List<Item> get items => [item1, item2, item3];
  List<String> get images => [item1.imageUrl, item2.imageUrl, item3.imageUrl];
  late String imgUrl = images[0];

  void selectItem(int index) {
    setState(() {
      for (int i = 0; i < items.length; i++) {
        items[i].isSelected = i == index;
      }

      imgUrl = items[index].imageUrl;
    });
  }

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
              height:
                  MediaQuery.of(context).size.height *
                  0.4, //40% of screen height
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
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
  left: 0,
  right: 0,
  child: Center(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(items.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: InkWell(
            onTap: () => selectItem(index),
            child: chipper(
              isSelected: items[index].isSelected,
            ),
          ),
        );
      }),
    ),
  ),
),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
