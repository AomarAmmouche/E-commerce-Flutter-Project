
import 'package:flutter/material.dart';

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

