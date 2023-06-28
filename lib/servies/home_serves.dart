import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class HomeServes {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection("Corssess");

  final CollectionReference _bestCollectionRef =
      FirebaseFirestore.instance.collection("Corssess");
  
  final CollectionReference _enrolledCoursesIDs =
      FirebaseFirestore.instance.collection('subscriptions');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.where("isFeatured", isEqualTo: true).get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestCourse() async {
    var value = await _bestCollectionRef.where("isMostSelling", isEqualTo: true).get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getEnrolledCourse() async {
    final box = GetStorage();
    String e = box.read('email') ?? "x";
    var value = await _enrolledCoursesIDs.where("email", isEqualTo: e).where("active",isEqualTo: true).get();
    return value.docs;
  }
}
