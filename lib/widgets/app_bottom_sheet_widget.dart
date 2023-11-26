import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class AppBottomSheetWidget extends StatelessWidget {
  final Widget widget;
  final bool isHighSheet;
  const AppBottomSheetWidget({
    super.key,
    required this.widget,
    this.isHighSheet = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isHighSheet ? 330.w : 280.w,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.w, right: 10.w),
            decoration: BoxDecoration(
              color: ColorsConstant.appWhite,
              borderRadius: BorderRadius.all(Radius.circular(20.w)),
            ),
            height: isHighSheet ? 250.w : 200.w,
            child: widget,
          ),
          // This container just to make sure the bottom part under
          // the widget is clickable to dismiss the bottom sheet
          SizedBox(
            height: 70.w,
            child: GestureDetector(onTap: () => Get.back()),
          )
        ],
      ),
    );
  }
}
