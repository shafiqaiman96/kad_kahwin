import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../api/api.dart';
import '../helpers/methods.dart';
import '../models/models.dart';

class WishesFormController extends GetxController {
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> wishController = TextEditingController().obs;

  Future<void> addWish() async {
    if (nameController.value.text != '' && wishController.value.text != '') {
      await FirebaseApi.addWish(
        WishesFormModel(
          name: nameController.value.text,
          wish: wishController.value.text,
          dateTime: DateTime.now().toString(),
        ),
      );
      nameController.value.text = '';
      wishController.value.text = '';
      await DialogHandler.showModal(
        'Terima Kasih',
        'Ucapan anda telah diterima',
      );
    } else {
      DialogHandler.showModal('Maaf', 'Sila isi nama dan ucapan');
    }
  }
}
