import 'package:flutter/material.dart';

class AvatarUserNameItem extends StatelessWidget {
  final String username;

  AvatarUserNameItem({
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
              backgroundImage:
                  AssetImage("assets/images/avatar_user_empty.png"),
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
