import 'package:cloud_firestore/cloud_firestore.dart';

class PromoCodeModel {
  String? name;
  bool? active;
  double? percent;


   PromoCodeModel({
     this.active,
     this.percent,
     this.name,
  });

  PromoCodeModel copyWith({
    String? name,
    bool? active,
    double? percent,

  }) {
    return PromoCodeModel(
      name: name ?? this.name,
      active: active ?? this.active,
      percent: percent ?? this.percent,
    );
  }

  factory PromoCodeModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;

    return PromoCodeModel(

      active: data['active'],
      name: data['name'],
      percent: double.tryParse(data['percent']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'active': active,
      'name': name,
      'percent': percent,    
    };
  }

  @override
  String toString() {
    return 'PromoCodeModel(active: $active, name: $name,percent: $percent, )';
  }
}
