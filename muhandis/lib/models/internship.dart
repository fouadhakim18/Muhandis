import 'package:cloud_firestore/cloud_firestore.dart';

class Internship {
  String title;
  String description;
  String duration;
  String? location;
  String field;
  // RequiredAttributes requiredAttributes;
  List<String> images;

  Internship({
    required this.title,
    required this.description,
    required this.duration,
    required this.field,
    this.location,
    // required this.requiredAttributes,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'duration': duration,
      'field': field,
      // 'requiredAttributes': requiredAttributes,
      "images": images
    };
  }

  factory Internship.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Internship(
        title: data['title'] ?? '',
        description: data['description'] ?? '',
        duration: data['duration'] ?? '',
        field: data['field'] ?? '',
        images: [],
        location: data['location'] ?? "Unavailable");
  }
}

class RequiredAttributes {
  List<String> skills;
  String education;
  String otherRequirements;

  RequiredAttributes({
    required this.skills,
    required this.education,
    required this.otherRequirements,
  });
}
