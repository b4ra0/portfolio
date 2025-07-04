import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_barao/models/professional_experience.dart';
import 'package:portfolio_barao/models/tool.dart';

class User {
  User({
    required this.uuid,
    required this.name,
    required this.location,
    required this.phoneNumber,
    required this.email,
    required this.age,
    required this.title,
    this.mainTools,
    this.photoUrl,
    this.aboutMe,
    this.professionalExperiences,
  });

  String uuid;
  String name;
  String location;
  String phoneNumber;
  String email;
  int age;
  String title;
  List<Tool>? mainTools;
  String? photoUrl;
  String? aboutMe;
  List<ProfessionalExperience>? professionalExperiences;

  static Future<User> fromJson(Map<String, dynamic> json,
      {String? photoUrl,
      QuerySnapshot<Map<String, dynamic>>? professionalExperiencesDocs}) async {
    final mainToolsRefs = (json['main_tools'] as List)
        .map((e) => e as DocumentReference<Map<String, dynamic>>)
        .toList();
    final mainToolsDocs =
        await Future.wait(mainToolsRefs.map((ref) => ref.get()));
    final mainTools = mainToolsDocs.map((doc) {
      final data = doc.data();
      if (data != null) {
        return Tool.fromJson(data);
      } else {
        throw Exception('Tool data is null');
      }
    }).toList();

    List<ProfessionalExperience> professionalExperiences = [];

    if (professionalExperiencesDocs != null) {
      professionalExperiencesDocs.docs
          .map((doc) => professionalExperiences
              .add(ProfessionalExperience.fromJson(doc.data())))
          .toList();
    }
    return User(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String,
      age: json['age'] as int,
      title: json['title'] as String,
      photoUrl: photoUrl,
      mainTools: mainTools,
      aboutMe: json['about_me'] as String?,
      professionalExperiences: professionalExperiences,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'name': name,
      'location': location,
      'phoneNumber': phoneNumber,
      'email': email,
      'age': age,
      'title': title,
      'about_me': aboutMe,
    };
  }
}
