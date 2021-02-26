import 'package:flutter/material.dart';

class AvatarUserNameWidget extends StatelessWidget {
  final String username;

  AvatarUserNameWidget({
    this.username,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Text('Avatar'),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                username,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
