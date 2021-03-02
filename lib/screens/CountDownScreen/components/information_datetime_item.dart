import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './datetime_content_item.dart';

class InformationDateTimeItem extends StatelessWidget {
  int estimateTs = DateTime(2021, 3, 3, 17, 00, 00).millisecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: StreamBuilder(
        stream: Stream.periodic(Duration(seconds: 1), (i) => i),
        builder: (BuildContext ctx, AsyncSnapshot<int> snapshot) {
          DateFormat format = DateFormat('HH:mm:ss');
          int now = DateTime.now().millisecondsSinceEpoch;
          Duration remaining = Duration(milliseconds: estimateTs - now);
          var dateString =
              '${remaining.inDays} : ${format.format(DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}';
          return Container(
            color: Colors.greenAccent.withOpacity(0.3),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //   remaining.inMilliseconds <= 0 ? 'Stop' : dateString,
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 20,
                //   ),
                // ),
                DateTimeContentItem(
                  number: '${remaining.inDays}',
                ),
                DateTimeContentItem(
                  number: '${remaining.inHours}',
                ),
                DateTimeContentItem(
                  number: '${remaining.inMinutes}',
                ),
                DateTimeContentItem(
                  number: '${remaining.inSeconds}',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
