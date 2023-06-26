import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServes {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection("Categories");

  final CollectionReference _bestCollectionRef =
      FirebaseFirestore.instance.collection("best courses");

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestCourse() async {
    var value = await _bestCollectionRef.get();

    return value.docs;
  }
}
