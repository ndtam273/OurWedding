import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:source_code/app_data.dart';
import 'package:source_code/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/background.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (BuildContext context, int index) {
            return index == 0
                ? Card(
                    color: Colors.white,
                    child: Icon(Icons.camera_alt_rounded,
                        size: getProportionateScreenWidth(48)),
                  )
                : Image.asset(
                    BACKGROUND_IMAGES[index],
                    fit: BoxFit.cover,
                  );
          },
          itemCount: BACKGROUND_IMAGES.length,
        ),
      ),
    );
  }
}
