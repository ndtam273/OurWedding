import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:source_code/providers/user_app.dart';
import './datetime_content_item.dart';

class InformationDateTimeItem extends StatefulWidget {
  @override
  _InformationDateTimeItemState createState() =>
      _InformationDateTimeItemState();
}

class _InformationDateTimeItemState extends State<InformationDateTimeItem> {
  @override
  Widget build(BuildContext context) {
    final userAppData = Provider.of<UserApp>(context);
    final weddingDayData = userAppData.weddingDay;

    int weddingDayMilliseconds =
        weddingDayData != null ? weddingDayData.millisecondsSinceEpoch : 0;

    bool isShowCountDown = weddingDayMilliseconds > 0;

    return AnimatedContainer(
      duration: const Duration(seconds: 5),
      color: isShowCountDown ? Colors.black26 : Colors.transparent,
      height: isShowCountDown ? 180 : 0,
      child: isShowCountDown
          ? StreamBuilder(
              stream: Stream.periodic(Duration(seconds: 1), (i) => i),
              builder: (BuildContext ctx, AsyncSnapshot<int> snapshot) {
                DateFormat format = DateFormat('HH:mm:ss');
                int now = DateTime.now().millisecondsSinceEpoch;
                int calulating = weddingDayMilliseconds - now;
                Duration remaining = Duration(milliseconds: calulating);
                var dateString =
                    '${remaining.inDays} : ${format.format(DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}';
                if (remaining.inMilliseconds <= 0) {
                  return Center(
                    child: Text(
                      'Quẩy Thôi !!!',
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          : Center(
              child: Text(
                'STOP !!!',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
    );
  }
}
