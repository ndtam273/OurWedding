import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './avatar_username_item.dart';
import './infomation_item.dart';
import './infomation_datetime.dart';
import './information_datetime_item.dart';
import '../../../providers/person.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final personData = Provider.of<Persion>(context);
    final loadMan = personData.findBySex(Sex.Man);
    final loadWoman = personData.findBySex(Sex.Woman);

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
                    item: loadMan,
                  ),
                  AvatarUserNameItem(
                    item: loadWoman,
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
