import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestCountDown extends StatelessWidget {
  // int estimateTs = DateTime.now().millisecondsSinceEpoch;
  int estimateTs = DateTime(2021, 3, 1, 17, 43, 50)
      .millisecondsSinceEpoch; // set needed date

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: StreamBuilder(
        stream: Stream.periodic(Duration(seconds: 1), (i) => i),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          DateFormat format = DateFormat('HH:mm:ss');
          int now = DateTime.now().millisecondsSinceEpoch;
          Duration remaining = Duration(milliseconds: estimateTs - now);
          var dateString =
              '${remaining.inDays} : ${format.format(DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}';
          return Container(
            color: Colors.greenAccent.withOpacity(0.3),
            alignment: Alignment.center,
            child: Text(
              remaining.inMilliseconds <= 0 ? 'Stop' : dateString,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}
