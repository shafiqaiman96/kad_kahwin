import 'package:cloud_firestore/cloud_firestore.dart';

import '../helpers/methods.dart';
import '../models/models.dart';

class FirebaseApi {
  // communicate with collection from Firebase
  static final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection(EnvironmentHandler.wishCollection);

  // retrieve list of wishes
  static final Stream<QuerySnapshot> wishesListStream = FirebaseFirestore
      .instance
      .collection(EnvironmentHandler.wishCollection)
      .snapshots();

  // add new wishes
  static Future<void> addWish(WishesFormModel wishesFormModel) {
    return _collectionReference
        .add(wishesFormModel.toJson())
        .then(
          (value) => DialogHandler.showModal(
            'Success',
            'Your task was added to the database',
          ),
        )
        .catchError(
          (error) => DialogHandler.showModal(
            'Failed',
            '$error',
            isFailed: true,
          ),
        );
  }
}
