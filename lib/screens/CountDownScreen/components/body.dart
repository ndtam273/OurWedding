import 'package:flutter/material.dart';

import './avatar_username_item.dart';
import './infomation_item.dart';
import './infomation_datetime.dart';
import './information_datetime_item.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InfomationItem(
              title: 'Ngày chung giường',
            ),
            InfomationDateTimeItem(
              title: '0:0:0:0',
            ),
            InfomationItem(
              title: 'Thời gian tới ngày kết hôn',
            ),
            InformationDateTimeItem(),
            Container(
              height: 200,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AvatarUserNameItem(
                    username: 'User Name 1',
                  ),
                  AvatarUserNameItem(
                    username: 'User Name 2',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
