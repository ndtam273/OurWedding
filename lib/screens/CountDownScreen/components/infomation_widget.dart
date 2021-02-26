import 'package:flutter/material.dart';

class InfomationWidget extends StatelessWidget {
  final String title;

  InfomationWidget({
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: FlatButton(
        onPressed: () {},
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
      ),
    );
  }
}
