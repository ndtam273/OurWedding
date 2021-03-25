import 'package:flutter/material.dart';
import '../../../enums.dart';
import './avatar_username_item.dart';
import './infomation_item.dart';
import './information_datetime_item.dart';
import 'datetime_wedding_item.dart';

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
            DateTimeWeddingItem(),
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
                  Flexible(
                    child: AvatarUserNameItem(
                      sex: Sex.Man,
                    ),
                  ),
                  Flexible(
                    child: AvatarUserNameItem(
                      sex: Sex.Woman,
                    ),
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
