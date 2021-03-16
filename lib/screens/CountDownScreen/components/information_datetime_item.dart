import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './datetime_content_item.dart';

class InformationDateTimeItem extends StatefulWidget {
  @override
  _InformationDateTimeItemState createState() =>
      _InformationDateTimeItemState();
}

class _InformationDateTimeItemState extends State<InformationDateTimeItem> {
  int estimateTs = 0;

  @override
  void initState() {
    _readSelectedDate();
    super.initState();
  }

  _readSelectedDate() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    int readMicroSecond = shared.getInt('kDateTime');
    int dateTimeNow = DateTime.now().millisecondsSinceEpoch;
    setState(() {
      estimateTs = readMicroSecond > 0 ? readMicroSecond : dateTimeNow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: estimateTs > 0
          ? StreamBuilder(
              stream: Stream.periodic(Duration(seconds: 1), (i) => i),
              builder: (BuildContext ctx, AsyncSnapshot<int> snapshot) {
                DateFormat format = DateFormat('HH:mm:ss');
                int now = DateTime.now().millisecondsSinceEpoch;
                int calulating = estimateTs - now;
                Duration remaining = Duration(milliseconds: calulating);
                var dateString =
                    '${remaining.inDays} : ${format.format(DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}';
                if (remaining.inMilliseconds <= 0) {
                  return Text('Stop');
                } else {
                  return Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DateTimeContentItem(
                          number: '${remaining.inDays}',
                          title: 'Ngày',
                        ),
                        DateTimeContentItem(
                          number: '${remaining.inHours}',
                          title: 'Giờ',
                        ),
                        DateTimeContentItem(
                          number: '${remaining.inMinutes}',
                          title: 'Phút',
                        ),
                        DateTimeContentItem(
                          number: '${remaining.inSeconds}',
                          title: 'Giây',
                        ),
                      ],
                    ),
                  );
                }
              },
            )
          : Text('STOP'),
    );
  }
}
