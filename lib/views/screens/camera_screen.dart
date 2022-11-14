import 'dart:typed_data';
import 'package:enigmalab/models/camera_mode.dart';
import 'package:enigmalab/views/screens/crop_screen.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'package:sizer/sizer.dart';
import '/utils/app_themes.dart';
import '../widgets/camera_screen_widgets.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MaterialApp(
      theme: AppThemes.normalTheme,
      home: CameraScreen(
        color: Palette.black.withOpacity(0.9),
        cameras: cameras,
        modes: [
          Mode(mode: 'OCR', description: 'Extracts Text From the Image'),
          Mode(
              mode: 'Image',
              description: 'Returns the image suitable for diagrams')
        ],
      )));
}

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  final List<Mode> modes;
  final Color color;

  const CameraScreen(
      {Key? key,
      required this.cameras,
      required this.modes,
      required this.color})
      : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  CameraController? controller;
  late File _imageGallery;
  late File _imageCamera;
  bool _isCameraInitialized = false;
  int _selectedModeIndex = 0;

  // varialbles for focus
  bool showFocusCircle = false;
  double x = 0;
  double y = 0;
  final ImagePicker _picker = ImagePicker();
  late Future<void> _initializeController;
  //LightMode lightMode = LightMode.auto;
  late FlashMode currentFlashMode;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
    //onNewCameraSelected(cameras[0]);
    currentFlashMode = FlashMode.off;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    controller?.dispose();
  }

  Future<Uint8List?> takePicture() async {
    //final CameraController cameraController = controller;
    if (controller!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }
    try {
      await controller!.initialize();
      await controller!.setFlashMode(currentFlashMode);
      //await Future.delayed(Duration(milliseconds: 500));
      //await controller.stopImageStream();
      //await Future.delayed(Duration(milliseconds: 200));
      XFile file = await controller!.takePicture();
      //setState(() {});
      return file.readAsBytes();
    } catch (e) {
      print('AN ERROR OCCURRED WHILE TAKING THE PICTURE: $e');
      //return null;
    }
  }

  Future<Uint8List?> pickFromPhotos() async {
    try {
      var img = await _picker.pickImage(source: ImageSource.gallery);
      return img!.readAsBytes();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      key: _scaffoldKey,
      body: Sizer(builder: (context, orientation, deviceType) {
        return Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: GestureDetector(
            onTapUp: (details) {
              _onTap(details);
            },
            child: Stack(
              children: [
                Container(
                  // height: double.maxFinite,
                  //width: double.maxFinite,
                  child: _isCameraInitialized
                      ? Transform.scale(
                          scale: 1.0,
                          child: AspectRatio(
                            aspectRatio:
                                MediaQuery.of(context).size.aspectRatio,
                            child: OverflowBox(
                              alignment: Alignment.center,
                              child: FittedBox(
                                fit: BoxFit.fitHeight,
                                child: Container(
                                  width: width,
                                  height: width * controller!.value.aspectRatio,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: <Widget>[
                                      CameraPreview(controller!),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ),
                Positioned(
                  right: 3.0.w,
                  top: 15.h,
                  child: Container(
                    height: 40.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                        color: Palette.black.withOpacity(0.4),
                        borderRadius: BorderRadius.all(Radius.circular(5.h))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () async {
                              await controller?.setFlashMode(FlashMode.auto);
                              setState(() {
                                //lightMode = LightMode.auto;
                                currentFlashMode = FlashMode.auto;
                              });
                            },
                            icon: Icon(
                              Icons.flash_auto_outlined,
                              color: currentFlashMode == FlashMode.auto
                                  ? Palette.white
                                  : Colors.grey,
                            )),
                        IconButton(
                            onPressed: () async {
                              setState(() {
                                //lightMode = LightMode.off;
                                currentFlashMode = FlashMode.off;
                              });
                              await controller?.setFlashMode(FlashMode.off);
                              // onSetFlashModeButtonPressed(FlashMode.off);
                            },
                            icon: Icon(
                              Icons.flash_off_outlined,
                              color: currentFlashMode == FlashMode.off
                                  ? Palette.white
                                  : Colors.grey,
                            )),
                        IconButton(
                            onPressed: () async {
                              // controller.setFlashMode(FlashMode.always);
                              setState(() {
                                //lightMode = LightMode.always;
                                currentFlashMode = FlashMode.always;
                              });
                              await controller?.setFlashMode(FlashMode.always);
                            },
                            icon: Icon(
                              Icons.flash_on_outlined,
                              color: currentFlashMode == FlashMode.always
                                  ? Palette.white
                                  : Colors.grey,
                            )),
                        IconButton(
                            onPressed: () async {
                              //controller.setFlashMode(FlashMode.torch);
                              setState(() {
                                //lightMode = LightMode.torch;
                                currentFlashMode = FlashMode.torch;
                              });
                              await controller?.setFlashMode(FlashMode.torch);
                            },
                            icon: Icon(
                              Icons.lightbulb_outline,
                              color: currentFlashMode == FlashMode.torch
                                  ? Palette.white
                                  : Colors.grey,
                            ))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 3.w,
                  right: 3.w,
                  bottom: 21.0.h,
                  child: Container(
                    //width: 80.0.w,
                    height: 7.0.h,
                    decoration: BoxDecoration(
                      color: Palette.black.withOpacity(0.4),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Center(
                      child: Text(
                        widget.modes[_selectedModeIndex].description,
                        style: const TextStyle(color: Palette.white),
                      ),
                    ),
                  ),
                ),
                // Positioned()
                Positioned(
                    left: 10,
                    right: 10,
                    bottom: 9.0.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () async {
                            Uint8List? imageUnit8List = await pickFromPhotos();
                            if (imageUnit8List != null) {
                              // ignore: use_build_context_synchronously
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CropScreen(
                                    image: imageUnit8List,
                                    modes: widget.modes,
                                    selectedModeIndex: 1);
                              }));
                            } else {
                              showInSnackBar('Picture access error');
                            }
                          },
                          child: Container(
                            height: 6.h,
                            width: 6.h,
                            decoration: BoxDecoration(
                                color: Palette.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.h))),
                            child: const Icon(Icons.image_outlined),
                          ),
                        ),
                        // Camera shutter Button
                        InkWell(
                          onTap: () async {
                            // take the picture
                            Uint8List? imageUnit8List = await takePicture();
                            if (imageUnit8List != null) {
                              // Move to the Image edit screen
                              // ignore: use_build_context_synchronously
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CropScreen(
                                    image: imageUnit8List,
                                    modes: widget.modes,
                                    selectedModeIndex: 1);
                              }));
                            } else {
                              showInSnackBar('Camera error');
                            }
                          },
                          child: Container(
                            height: 10.h,
                            width: 10.h,
                            decoration: BoxDecoration(
                                color: Palette.white,
                                borderRadius: BorderRadius.circular(5.h),
                                border: Border.all(color: Palette.darkGreen)),
                          ),
                        ),
                        Container(
                          height: 5.h,
                          width: 5.h,
                          decoration:
                              const BoxDecoration(color: Colors.transparent),
                        ),
                      ],
                    )),

                Positioned(
                    left: 30.0,
                    right: 30.0,
                    bottom: 1.0.h,
                    child: Container(
                      height: 5.h,
                      width: double.maxFinite,
                      child: Row(
                          //scrollDirection: Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(widget.modes.length, (index) {
                            return CameraMode(
                              color: widget.color,
                              onpressed: () {
                                setState(() {
                                  _selectedModeIndex = index;
                                });
                              },
                              label: widget.modes[index].mode,
                              fillisColor:
                                  _selectedModeIndex == index ? true : false,
                              labelisWhite:
                                  _selectedModeIndex == index ? true : false,
                            );
                          })),
                    )),
                if (showFocusCircle)
                  Positioned(
                      top: y - 20,
                      left: x - 20,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.white, width: 1.5)),
                      ))
              ],
            ),
          ),
        );
      }),
    );
  }

  void onSetFlashModeButtonPressed(FlashMode mode) {
    setFlashMode(mode).then((_) {
      if (mounted) {
        setState(() {});
      }
      //showInSnackBar('Flash mode set to ${mode.toString().split('.').last}');
    });
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;
    // Instantiating the camera controller
    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    // Dispose the previous controller
    await previousCameraController?.dispose();

    // Replace with the new controller
    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    // Initialize controller
    try {
      await cameraController.initialize();
      //currentFlashMode = cameraController.value.flashMode;
      cameraController.setFlashMode(currentFlashMode);
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    // Update the Boolean
    if (mounted) {
      setState(() {
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }
  }

  void showInSnackBar(String message) {
    // ignore: deprecated_member_use
    //_scaffoldKey.currentState?.showSnackBar(SnackBar(content: Text(message)));
    ScaffoldMessenger.of(_scaffoldKey.currentContext!)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController cameraController = controller!;

    // App state changed before we got the chance to initialize.

    if (cameraController == null ||
        cameraController.value.isInitialized != null) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
  }

  Future<void> _onTap(TapUpDetails details) async {
    if (controller!.value.isInitialized) {
      showFocusCircle = true;
      x = details.localPosition.dx;
      y = details.localPosition.dy;

      double fullWidth = MediaQuery.of(context).size.width;
      double cameraHeight = fullWidth * controller!.value.aspectRatio;

      double xp = x / fullWidth;
      double yp = y / cameraHeight;

      Offset point = Offset(xp, yp);
      print("point : $point");

      // Manually focus
      await controller?.setFocusPoint(point);

      // Manually set light exposure
      //controller.setExposurePoint(point);

      setState(() {
        Future.delayed(const Duration(seconds: 2)).whenComplete(() {
          setState(() {
            showFocusCircle = false;
          });
        });
      });
    }
  }

  Future<void> setFlashMode(FlashMode mode) async {
    if (controller == null) {
      return;
    }

    try {
      await controller!.setFlashMode(mode);
    } on CameraException catch (e) {
      print(e);
      rethrow;
    }
  }
}
