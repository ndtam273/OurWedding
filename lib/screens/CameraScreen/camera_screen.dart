import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:source_code/enums.dart';
import 'package:source_code/screens/PreviewScreen/preview_screen.dart';

import '../../size_config.dart';

class CameraScreen extends StatefulWidget {
  static String routeName = "/camera_screen";

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController controller;
  List cameras;
  int selectedCameraIdx;
  String imagePath;

  @override
  void initState() {
    super.initState();
    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      if (cameras.length > 0) {
        setState(() {
          selectedCameraIdx = 0;
        });
        _initCameraController(cameras[selectedCameraIdx]).then((void v) {});
      } else {
        print("No camera available");
      }
    }).catchError((err) {
      print('Error: $err.code\nError Message: $err.message');
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        print('Camera error ${controller.value.errorDescription}');
      }
    });
    try {
      await controller.initialize();
    } on CameraException catch (e) {
      print('Camera Exception $e');
      // _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }
    return CameraPreview(controller);
  }

  /// Custom lens camera
  _cameraTogglesLensWidget() {
    if (cameras == null || cameras.isEmpty) {
      return Spacer();
    }

    CameraDescription selectedCamera = cameras[selectedCameraIdx];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return FloatingActionButton(
      heroTag: null,
      child: Icon(_getCameraLensIcon(lensDirection)),
      onPressed: _onSwitchCamera,
    );
  }

  _onSwitchCamera() {
    selectedCameraIdx =
        selectedCameraIdx < cameras.length - 1 ? selectedCameraIdx + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIdx];
    _initCameraController(selectedCamera);
  }

  IconData _getCameraLensIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.back:
        return Icons.camera_rear;
      case CameraLensDirection.front:
        return Icons.camera_front;
      case CameraLensDirection.external:
        return Icons.camera;
      default:
        return Icons.device_unknown;
    }
  }

  /// Custom flash camera
  _cameraTogglesFlashWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return Spacer();
    }

    return FloatingActionButton(
      heroTag: null,
      child: Text(
        _getCameraFlashIcon(controller.value.flashMode),
      ),
      onPressed: () {
        switch (controller.value.flashMode) {
          case FlashMode.auto:
            // **For Flash ON**
            controller.setFlashMode(FlashMode.always);
            break;
          case FlashMode.always:
            //**For Flash OFF**:
            controller.setFlashMode(FlashMode.off);
            break;
          case FlashMode.off:
            //**For Flash AUTO**:
            controller.setFlashMode(FlashMode.auto);
            break;
          default:
            controller.setFlashMode(FlashMode.auto);
            break;
        }
      },
    );
  }

  String _getCameraFlashIcon(FlashMode mode) {
    switch (mode) {
      case FlashMode.auto:
        return 'AUTO';
      case FlashMode.always:
        return 'ON';
      case FlashMode.off:
        return 'OFF';
      default:
        return '...';
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final sexSelected = ModalRoute.of(context).settings.arguments as Sex;

    return Scaffold(
      appBar: AppBar(
        title: Text("Camera Screen"),
      ),
      body: _cameraPreviewWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: _cameraTogglesLensWidget(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              heroTag: null,
              child: Icon(Icons.camera),
              onPressed: () async {
                try {
                  final image = await controller.takePicture();
                  if (image != null) {
                    Navigator.pushNamed(
                      context,
                      PreviewScreen.routeName,
                      arguments: {
                        'imagePath': image.path,
                        'sex': sexSelected,
                      },
                    );
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: _cameraTogglesFlashWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
