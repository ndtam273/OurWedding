import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:source_code/providers/person.dart';

class AvatarUserNameItem extends StatelessWidget {
  final PersionItem item;

  AvatarUserNameItem({
    this.item,
  });

  TextEditingController _textFieldController = TextEditingController();

  void _displayTextInputDialog(BuildContext context) async {
    _textFieldController.text = item.name;

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
                  Provider.of<Persion>(
                    context,
                    listen: false,
                  ).updatePersion(
                    item.sex,
                    PersionItem(
                      sex: item.sex,
                      name: _textFieldController.text,
                      nickName: item.nickName,
                      avatar: item.avatar,
                    ),
                  );
                }
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            onPressed: () {
              print('Pressed Avatar');
            },
            child: CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage("assets/images/avatar_user_empty.png"),
            ),
          ),
          FlatButton(
            onPressed: () {
              _displayTextInputDialog(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                item.name,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
