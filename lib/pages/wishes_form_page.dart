import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../controllers/controllers.dart';
import '../widgets/widgets.dart';

class WishesFormPage extends StatelessWidget {
  const WishesFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishesController = Get.put(WishesFormController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsConstant.appWhite,
        elevation: 0,
        title: Text(
          'Tinggalkan Ucapan',
          style: TextStyle(color: ColorsConstant.appDarkGreen, fontSize: 16.sp),
        ),
        leading: IconButton(
          icon: Icon(Icons.adaptive.arrow_back),
          iconSize: 18.sp,
          color: ColorsConstant.appDarkGreen,
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsConstant.flowerPlain),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              SizedBox(height: 20.w),
              AppTextFieldWidget(
                label: 'Nama',
                hint: 'Firash',
                textEditingController: wishesController.nameController.value,
              ),
              SizedBox(height: 10.w),
              AppTextFieldWidget(
                label: 'Ucapan',
                hint: 'Selamat pengantin baru',
                textEditingController: wishesController.wishController.value,
              ),
              SizedBox(height: 30.w),
              AppButtonWidget(
                buttonTitle: 'Hantar',
                buttonIcon: Icons.send,
                buttonFunction: () async {
                  await wishesController.addWish();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
