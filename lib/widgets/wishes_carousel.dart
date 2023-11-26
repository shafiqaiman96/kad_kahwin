import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../api/api.dart';
import '../constants/constants.dart';
import '../models/models.dart';

class WishesCarousel extends StatelessWidget {
  const WishesCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ColorsConstant.appEffectGreen,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseApi.wishesListStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                SizedBox(height: 30.w),
                const Text('Harap maaf, sila cuba lagi nanti'),
              ],
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          return CarouselSlider(
            options: CarouselOptions(),
            items:
                snapshot.data!.docs.reversed.map((DocumentSnapshot document) {
              WishesFormModel data = WishesFormModel.fromJson(
                document.data() as Map<String, dynamic>,
              );

              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetsConstant.flowerFrame),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20.w)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data.wish,
                          style: TextStyle(
                            fontSize: 20.w,
                            color: ColorsConstant.appDarkGreen,
                          ),
                        ),
                        Text(
                          '- ${data.name} -',
                          style: TextStyle(
                            fontSize: 18.w,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: ColorsConstant.appDarkGreen,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
