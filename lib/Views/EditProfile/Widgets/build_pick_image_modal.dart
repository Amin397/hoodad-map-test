import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled1/Consts/colors.dart';
import 'package:untitled1/Consts/measures.dart';

class BuildPickImageModal extends StatelessWidget {
  const BuildPickImageModal({super.key, });


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back(result: 2);
        return true;
      },
      child: Container(
        width: Get.width,
        height: Get.height * .3,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: paddingAll16,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  Get.back(result: 2);
                },
              ),
            ),
            Expanded(
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Column(
                  children: [
                    _buildImagePickerItem(
                      isCamera: true,
                    ),
                    _buildImagePickerItem(
                      isCamera: false,
                    ),
                    SizedBox(height: 8.0,),
                    // if (hasImage) _buildDeleteItem(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImagePickerItem({
    required bool isCamera,
  }) {
    return Flexible(
      flex: 1,
      child: InkWell(
        onTap: () {
          Get.back(result: (isCamera) ? 1 : 0);
        },
        child: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Lottie.asset(
                  (isCamera)
                      ? 'assets/anims/camera.json'
                      : 'assets/anims/gallery.json',
                ),
                Text(
                  (isCamera) ? 'گرفتن عکس با دوربین' : 'انتخاب از گالری',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: titleTextColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  //
  // Widget _buildDeleteItem() {
  //   return Flexible(
  //     flex: 1,
  //     child: InkWell(
  //       onTap: () {
  //         Get.back(result: 3);
  //       },
  //       child: SizedBox(
  //         height: double.maxFinite,
  //         width: double.maxFinite,
  //         child: Row(
  //           children: [
  //             Lottie.asset(
  //               'assets/anims/delete.json',
  //             ),
  //             Text(
  //               'Delete Image',
  //               style: TextStyle(
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
