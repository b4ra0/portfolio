import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_barao/models/tool.dart';

class ProfessionalExperience {
  String description;
  DateTime? endDate;
  String location;
  String name;
  String position;
  DateTime startDate;
  String? url;
  String? logoUrl;
  List<Tool>? tools;

  ProfessionalExperience({
    required this.description,
    this.endDate,
    required this.location,
    required this.name,
    required this.position,
    required this.startDate,
    this.url,
    this.logoUrl,
    this.tools,
  });

  static ProfessionalExperience fromJson(Map<String, dynamic> json) {
    return ProfessionalExperience(
      description: json['description'],
      location: json['location'],
      name: json['name'],
      position: json['position'],
      startDate: json['start'].toDate(),
      endDate: json['end'].toDate(),
      url: json['url'],
      logoUrl: json['logo_url'],
    );
  }


}
