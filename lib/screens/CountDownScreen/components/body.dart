import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.amber,
            child: Center(
              child: Text(
                'Thoi gian',
              ),
            ),
          )
        ],
      ),
    );
  }
}
