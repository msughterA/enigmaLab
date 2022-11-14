import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:enigmalab/views/widgets/filtered_image_widget.dart';
import 'package:photofilters/filters/filters.dart';
import 'package:enigmalab/utils/app_themes.dart';

class FilteredImageListWidget extends StatelessWidget {
  final List<Filter> filters;
  final img.Image image;
  final ValueChanged<Filter> onChangedFilter;
  final String selectedFilterName;

  const FilteredImageListWidget(
      {Key? key,
      required this.filters,
      required this.image,
      required this.onChangedFilter,
      required this.selectedFilterName})
      : super(key: key);
  //List<int> filteredImage;
  @override
  Widget build(BuildContext context) {
    const double height = 150;

    return Container(
      height: height,
      color: Palette.black,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filter = filters[index];

          return InkWell(
            onTap: () => onChangedFilter(filter),
            child: Container(
              padding: EdgeInsets.all(4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: FilteredImageWidget(
                      filter: filter,
                      image: image,
                      successBuilder: (imageBytes) => CircleAvatar(
                        backgroundColor: filter.name == selectedFilterName
                            ? Palette.yellow
                            : Colors.transparent,
                        radius: 42,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              MemoryImage(Uint8List.fromList(imageBytes!)),
                          backgroundColor: Colors.white,
                        ),
                      ),
                      errorBuilder: () => const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.report, size: 32),
                      ),
                      loadingBuilder: () => const CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    filter.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Palette.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
