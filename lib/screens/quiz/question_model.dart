import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  String? name;
  int? seconds;
  Map<String, dynamic>? answers;


   QuestionModel({
     this.name,
     this.answers,
     this.seconds,
  });

  QuestionModel copyWith({
    String? name,
    Map<String, dynamic>? answers,
    int? seconds

  }) {
    return QuestionModel(
      name: name ?? this.name,
      answers: answers ?? this.answers,
      seconds: seconds ?? this.seconds,
    );
  }

  factory QuestionModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;

    return QuestionModel(
      name: data['name']??"Unkown",
      answers: data['answers'] !=null?data['answers'] as Map<String, dynamic>:null,
      seconds: data['seconds']!=null?data['seconds'] as int:null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,  
      'answers': answers,
      'seconds': seconds, 
    };
  }

  @override
  String toString() {
    return 'QuestionModel(name: $name)';
  }
}
