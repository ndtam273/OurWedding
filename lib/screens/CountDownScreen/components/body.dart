import 'package:flutter/material.dart';

import './avatar_username_widget.dart';
import './infomation_widget.dart';

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
            InfomationWidget(
              title: 'Thời gian tới ngày kết hôn',
            ),
            InfomationWidget(
              title: '0:0:0:0',
            ),
            InfomationWidget(
              title: 'Ngày Giờ Phút Giây',
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AvatarUserNameWidget(
                    username: 'User Name 1',
                  ),
                  AvatarUserNameWidget(
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
