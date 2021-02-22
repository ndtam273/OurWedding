import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image(image: AssetImage('graphics/background.png'));
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Thời gian tới ngày kết hôn',
                ),
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              child: Center(
                child: Text(
                  '0:0:0:0',
                ),
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Ngày  Giờ  Phút  Giây',
                ),
              ),
            ),
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.amber,
              child: Center(
                child: Text(
                  'Avatar',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
