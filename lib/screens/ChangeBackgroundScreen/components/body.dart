import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:provider/provider.dart';
import 'package:source_code/providers/user_app.dart';
import 'package:source_code/screens/ChangeBackgroundScreen/components/background_item.dart';
import 'package:source_code/screens/CountDownScreen/count_down_screen.dart';
import 'package:source_code/size_config.dart';
import 'dart:io';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  File _storedImage;

  Future<void> _pickPicture() async {
    final picker = ImagePicker();
    final imageFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _storedImage = File(imageFile.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage =
        await File(imageFile.path).copy("${appDir.path}/$fileName");
    // widget.onSelectImage(savedImage);
    Provider.of<UserApp>(context, listen: false).addBackground(savedImage);
    print(Provider.of<UserApp>(context, listen: false).backgroundImages.length);
  }

  @override
  Widget build(BuildContext context) {
    final userAppData = Provider.of<UserApp>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: userAppData.getBackgroundImage(),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Consumer<UserApp>(
          builder: (context, user, ch) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (BuildContext context, int index) {
                return index == 0
                    ? GestureDetector(
                        onTap: _pickPicture,
                        child: Card(
                          color: Colors.white,
                          child: Icon(Icons.camera_alt_rounded,
                              size: getProportionateScreenWidth(48)),
                        ),
                      )
                    : index == 1
                        ? FlatButton(
                            onPressed: () {
                              Provider.of<UserApp>(
                                context,
                                listen: false,
                              ).updateBackgroundSelected("");
                              Navigator.of(context).pushReplacementNamed(
                                  CountDownScreen.routeName);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/background.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        : BackgroundItem(user.backgroundImages[index]);
              },
              itemCount: user.backgroundImages.length + 1,
            );
          },
        ),
      ),
    );
  }
}
