import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
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

    return Container(
      color: isShowCountDown ? Colors.black26 : Colors.transparent,
      height: isShowCountDown ? 80 : 0,
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
                DateTime dateTimeCovert = DateTime.fromMillisecondsSinceEpoch(
                    remaining.inMilliseconds);

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
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DateTimeContentItem(
                          number: '${remaining.inDays}',
                          title: 'Ngày',
                        ),
                        DateTimeContentItem(
                          number: '${DateFormat('HH').format(dateTimeCovert)}',
                          title: 'Giờ',
                        ),
                        DateTimeContentItem(
                          number: '${DateFormat('mm').format(dateTimeCovert)}',
                          title: 'Phút',
                        ),
                        DateTimeContentItem(
                          number: '${DateFormat('ss').format(dateTimeCovert)}',
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
