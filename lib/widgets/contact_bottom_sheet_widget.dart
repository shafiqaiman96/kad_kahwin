import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';
import '../db/db.dart';
import '../helpers/methods.dart';

class ContactBottomSheetWidget extends StatefulWidget {
  const ContactBottomSheetWidget({super.key});

  @override
  State<ContactBottomSheetWidget> createState() =>
      _ContactBottomSheetWidgetState();
}

class _ContactBottomSheetWidgetState extends State<ContactBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listContact
          .asMap()
          .entries
          .map(
            (e) => Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.value.name,
                            style: TextStyle(fontSize: 20.sp),
                          ),
                          Text(
                            e.value.phoneNo,
                            style: TextStyle(fontSize: 17.sp),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          InkWell(
                            child: Image.asset(
                              AssetsConstant.callIcon,
                              fit: BoxFit.scaleDown,
                              width: 34.sp,
                            ),
                            onTap: () async {
                              await ContactHandler.openCall(e.value.phoneNo);
                            },
                          ),
                          SizedBox(width: 14.w),
                          InkWell(
                            child: Image.asset(
                              AssetsConstant.whatsappIcon,
                              fit: BoxFit.scaleDown,
                              width: 34.sp,
                            ),
                            onTap: () async {
                              await ContactHandler.openWhatsapp(
                                e.value.phoneNo,
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  e.key != (listContact.length - 1)
                      ? const Divider()
                      : const SizedBox()
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
