import 'dart:convert';
import 'package:flutter/material.dart';
import '/utils/app_themes.dart';
import 'dart:typed_data';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:sizer/sizer.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../widgets/camera_screen_widgets.dart';
import 'package:enigmalab/models/camera_mode.dart';
import 'package:enigmalab/views/widgets/filtered_image_list_widget.dart';
import 'package:enigmalab/views/widgets/filtered_image_widget.dart';
import 'package:photofilters/filters/filters.dart';
import 'package:photofilters/filters/preset_filters.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/foundation.dart';

//import 'camera_screen.dart';
void main() {}

class CropScreen extends StatefulWidget {
  Uint8List image;
  final List<Mode> modes;
  final int selectedModeIndex;

  CropScreen({
    Key? key,
    required this.image,
    required this.modes,
    required this.selectedModeIndex,
  }) : super(key: key);

  @override
  _CropScreenState createState() => _CropScreenState();
}

class _CropScreenState extends State<CropScreen> {
  final _cropController = CropController();
  int _selectedModeIndex = 0;
  bool _isLoading = false;
  bool _isFilter = false;
  Filter filter = presetFiltersList.first;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedModeIndex = widget.selectedModeIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0.0.h),
                  child: Container(
                    height: 6.0.h,
                    width: 90.0.h,
                    color: Palette.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              // Go back to Camera screen
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_outlined,
                              color: Palette.white,
                            )),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              // handles changing the bottom section
                              // from information selection to contrast selection
                              setState(() {
                                _isFilter = !_isFilter;
                              });
                            },
                            icon: Icon(
                              _isFilter
                                  ? Icons.crop_16_9_outlined
                                  : Icons.filter_b_and_w,
                              color: Palette.white,
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 2.0.w),
                          child: InkWell(
                            onTap: () {
                              if (_isLoading == false) {
                                // notify is loading icon
                                setState(() {
                                  _isLoading = true;
                                });
                                // Crop the image
                                _cropController.crop();
                              }
                            },
                            child: Container(
                              height: 4.0.h,
                              width: 18.0.w,
                              decoration: const BoxDecoration(
                                  color: Palette.yellow,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0))),
                              child: Center(
                                child: _isLoading
                                    ? const SizedBox(
                                        height: 12.0,
                                        width: 14.0,
                                        child: CircularProgressIndicator(),
                                      )
                                    : const Text('Save'),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                _isFilter
                    ? Expanded(child: buildImage())
                    : Expanded(
                        child: Container(
                            child: Crop(
                          baseColor: Palette.black,
                          image: widget.image,
                          controller: _cropController,
                          onCropped: (image) {
                            // Push to the Result rendering screen and make an api call
                            var _img = base64Encode(image);
                            // send the image to the question and answer display screen
                          },
                        )),
                      ),
                Container(
                    height: 20.0.h,
                    color: Palette.black,
                    child: _isFilter
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: Palette.black,
                                child: buildFilters(),
                              )
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                //width: 80.0.w,
                                margin:
                                    const EdgeInsets.only(left: 20, right: 20),
                                height: 7.0.h,
                                decoration: const BoxDecoration(
                                  color: Palette.darkGreen,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Center(
                                  child: Text(widget
                                      .modes[_selectedModeIndex].description),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    //scrollDirection: Axis.vertical,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: List.generate(widget.modes.length,
                                        (index) {
                                      return CameraMode(
                                        color: Palette.black.withOpacity(0.4),
                                        onpressed: () {
                                          setState(() {
                                            _selectedModeIndex = index;
                                          });
                                        },
                                        label: widget.modes[index].mode,
                                        fillisColor: _selectedModeIndex == index
                                            ? true
                                            : false,
                                        labelisWhite:
                                            _selectedModeIndex == index
                                                ? true
                                                : false,
                                      );
                                    })),
                              ),
                            ],
                          ))
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildFilters() {
    if (widget.image == null) return Container();
    // File imag = File(Image.memory(widget.image));
    return FilteredImageListWidget(
      filters: presetFiltersList,
      selectedFilterName: filter.name,
      image: img.decodeImage(widget.image)!,
      onChangedFilter: (filterChange) {
        setState(() {
          filter = filterChange;
          // widget.image = Uint8List.fromList(image!);
        });
      },
    );
  }

  Widget buildImage() {
    double height = 75.h;
    if (widget.image == null) return Container();

    return FilteredImageWidget(
      filter: filter,
      image: img.decodeImage(widget.image)!,
      successBuilder: (image) {
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        //   // executes after build
        //   setState(() {
        //     widget.image = Uint8List.fromList(image!);
        //   });
        // });
        return Image.memory(Uint8List.fromList(image!),
            height: height, fit: BoxFit.fitHeight);
      },
      errorBuilder: () => Container(height: height),
      loadingBuilder: () => Container(
        // height: height,
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
