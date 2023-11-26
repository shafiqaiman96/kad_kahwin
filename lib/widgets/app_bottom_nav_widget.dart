import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../constants/constants.dart';
import '../helpers/methods.dart';
import 'widgets.dart';

class AppButtonNavWidget extends StatelessWidget {
  const AppButtonNavWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GNav(
      selectedIndex: -1,
      backgroundColor: ColorsConstant.appMainGreen,
      rippleColor: ColorsConstant.appEffectGreen,
      hoverColor: ColorsConstant.appEffectGreen,
      haptic: true,
      tabBorderRadius: 15.w,
      curve: Curves.easeOutExpo,
      duration: const Duration(milliseconds: DataConstant.animationTimer),
      gap: 8.w,
      color: ColorsConstant.appDarkGreen,
      activeColor: ColorsConstant.appWhite,
      iconSize: 40.sp,
      tabMargin: EdgeInsets.all(5.w),
      tabBackgroundColor: Colors.white.withOpacity(0.1),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.w),
      tabs: [
        GButton(
          icon: Icons.calendar_month,
          text: 'Kalendar',
          onPressed: () async {
            await CalendarHandler.addCalendar();
          },
        ),
        GButton(
          icon: Icons.location_on,
          text: 'Lokasi',
          onPressed: () {
            Get.bottomSheet(
              const AppBottomSheetWidget(
                widget: LocationBottomSheetWidget(),
              ),
              enterBottomSheetDuration:
                  const Duration(milliseconds: DataConstant.animationTimer),
              exitBottomSheetDuration:
                  const Duration(milliseconds: DataConstant.animationTimer),
            );
          },
        ),
        GButton(
          icon: Icons.phone,
          text: 'Hubungi',
          onPressed: () {
            Get.bottomSheet(
              const AppBottomSheetWidget(
                widget: ContactBottomSheetWidget(),
                isHighSheet: true,
              ),
              enterBottomSheetDuration:
                  const Duration(milliseconds: DataConstant.animationTimer),
              exitBottomSheetDuration:
                  const Duration(milliseconds: DataConstant.animationTimer),
            );
          },
        ),
      ],
    );
  }
}
