import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:source_code/providers/user_app.dart';
import 'package:source_code/screens/CameraScreen/camera_screen.dart';

import '../../../enums.dart';

class AvatarUserNameItem extends StatelessWidget {
  final Sex sex;

  AvatarUserNameItem({
    this.sex,
  });

  TextEditingController _textFieldController = TextEditingController();

  _displayTextInputDialog(BuildContext context) async {
    final userAppData = Provider.of<UserApp>(context, listen: false);
    String name =
        sex == Sex.Man ? '${userAppData.nameMan}' : '${userAppData.nameWoman}';

    _textFieldController.text = name;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Thay đổi tên'),
          content: TextField(
            autofocus: true,
            onChanged: (value) {},
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Nhập tên của bạn"),
          ),
          actions: [
            FlatButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text('Lưu'),
              onPressed: () {
                if (_textFieldController.text.isNotEmpty) {
                  // Save when text not empty
                  if (sex == Sex.Man) {
                    userAppData.updateNameMan(
                      _textFieldController.text,
                    );
                  } else {
                    userAppData.updateNameWoman(
                      _textFieldController.text,
                    );
                  }
                }
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  _showBottonModalPopup(BuildContext ctx) {
    final ThemeData theme = Theme.of(ctx);
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.iOS:
        return _showCupertinoModalPopup(ctx);
      default:
        print('${theme.platform} not handle');
        break;
    }
  }

  _showCupertinoModalPopup(BuildContext ctx) {
    showCupertinoModalPopup(
      context: ctx,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text(
          'Đổi avatar',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        message: const Text('Chọn avatar từ'),
        actions: [
          CupertinoActionSheetAction(
            child: const Text('Chụp Ảnh'),
            onPressed: () {
              Navigator.pop(context);
              // ...
              Navigator.pushNamed(
                context,
                CameraScreen.routeName,
                arguments: sex,
              );
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Albums'),
            onPressed: () {
              Navigator.pop(context);
              // ...
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context, 'Cancel');
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userAppData = Provider.of<UserApp>(context);
    final avatar = sex == Sex.Man
        ? userAppData.avatarMan.isNotEmpty
            ? FileImage(
                File(userAppData.avatarMan),
              )
            : AssetImage("assets/images/avatar_user_empty.png")
        : userAppData.avatarWoman.isNotEmpty
            ? FileImage(
                File(userAppData.avatarWoman),
              )
            : AssetImage("assets/images/avatar_user_empty.png");

    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          FlatButton(
            onPressed: () {
              _showBottonModalPopup(context);
            },
            child: CircleAvatar(radius: 50, backgroundImage: avatar),
          ),
          FlatButton(
            onPressed: () {
              _displayTextInputDialog(context);
            },
            child: Text(
              sex == Sex.Man
                  ? '${userAppData.nameMan}'
                  : '${userAppData.nameWoman}',
              textAlign: TextAlign.center,
              maxLines: 3,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
