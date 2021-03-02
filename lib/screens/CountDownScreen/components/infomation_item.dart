import 'package:flutter/material.dart';

class InfomationItem extends StatelessWidget {
  final String title;

  InfomationItem({
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
