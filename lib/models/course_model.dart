import 'package:cloud_firestore/cloud_firestore.dart';

class CourseModel {
  String? id;
  String? name;
  String? doctorname;
  bool? isFeatured;
  bool? isMostSelling;
  String? lang;
  String? image;
  double? price;
  String? level;

   CourseModel({
     this.id,
     this.doctorname,
     this.isFeatured,
     this.isMostSelling,
     this.lang,
     this.name,
     this.image,
     this.price,
     this.level
  });

  CourseModel copyWith({
    String? id,
    String? name,
    String? doctorname,
    String? image,
    bool? isFeatured,
    bool? isMostSelling,
    String? lang,
    double?price,
    String? level
  }) {
    return CourseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      doctorname: doctorname ?? this.doctorname,
      image: image ?? this.image,
      isFeatured: isFeatured ?? this.isFeatured,
      isMostSelling: isMostSelling ?? this.isMostSelling,
      lang: lang ?? this.lang,
      price: price ?? this.price,
      level: level ?? this.level,
    );
  }

  factory CourseModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;

    return CourseModel(
      id: data['id'],
      doctorname: data['doctorname'],
      image: data['image'],
      isFeatured: data['isFeatured'],
      isMostSelling: data['isMostSelling'],
      lang: data['lang'],
      name: data['name'],
      level: data['level'],
      price: double.tryParse(data['price']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'detailsId': doctorname,
      'coverImageUrl': image,
      'isFeatured': isFeatured,
      'isMostSelling': isMostSelling,
      'lang': lang,
      'name': name,
      'price': price,
      'level': level,      
    };
  }

  @override
  String toString() {
    return 'CourseModel(id: $id, doctorname: $doctorname, isFeatured: $isFeatured, isMostSelling: $isMostSelling, lang: $lang, image: $image, name: $name,level: $level,price: $price, )';
  }
}
