import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeContentItem extends StatelessWidget {
  final String number;

  DateTimeContentItem({
    this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      // height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text(
          //   'Còn',
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     fontSize: 20,
          //   ),
          // ),
          Container(
            width: 200,
            child: Text(
              number,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            'Ngày',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
