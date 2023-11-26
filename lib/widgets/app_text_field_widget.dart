import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kad_kahwin/constants/colors_constant.dart';

class AppTextFieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController textEditingController;
  final String? hint;
  const AppTextFieldWidget({
    Key? key,
    required this.label,
    required this.textEditingController,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelStyle: TextStyle(
          color: ColorsConstant.appDarkGreen,
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 5.w),
        alignLabelWithHint: true,
        labelText: '  $label',
        hintText: '  $hint',
        hintStyle: TextStyle(
          color: ColorsConstant.appDarkGreen.withOpacity(.4),
          fontSize: 12.sp,
        ),
        labelStyle: TextStyle(
          color: ColorsConstant.appDarkGreen,
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: ColorsConstant.appDarkGreen.withOpacity(.3)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsConstant.appDarkGreen),
        ),
      ),
      maxLines: label == 'Nama' ? 1 : 10,
    );
  }
}
