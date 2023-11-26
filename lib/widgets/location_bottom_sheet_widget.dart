import 'package:flutter/material.dart';
import 'package:kad_kahwin/helpers/methods.dart';

import '../constants/constants.dart';

class LocationBottomSheetWidget extends StatelessWidget {
  const LocationBottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < 2; i++) ...[
          InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  i == 0 ? AssetsConstant.gmapIcon : AssetsConstant.wazeIcon,
                  scale: 2,
                ),
                i == 0 ? const Text('Buka GMap') : const Text('Buka Waze')
              ],
            ),
            onTap: () async {
              i == 0
                  ? await MapHandler.launchGoogleMaps(
                      EnvironmentHandler.lat,
                      EnvironmentHandler.lon,
                    )
                  : MapHandler.launchWaze(
                      EnvironmentHandler.lat,
                      EnvironmentHandler.lon,
                    );
            },
          ),
        ]
      ],
    );
  }
}
