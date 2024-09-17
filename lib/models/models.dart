import 'package:cloud_firestore/cloud_firestore.dart';

class ExperienceModel {
  String poste;
  String company;
  DateTime startPeriod;
  DateTime endPeriod;
  List<String> images;
  String description;

  ExperienceModel({
    required this.poste,
    required this.company,
    required this.startPeriod,
    required this.endPeriod,
    required this.images,
    required this.description,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      poste: json['poste'],
      company: json['company'],
      startPeriod: (json['startPeriod'] as Timestamp).toDate(),
      endPeriod: (json['endPeriod'] as Timestamp).toDate(),
      images: (json['images'] as List).cast<String>(),
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'poste': poste,
      'company': company,
      'startPeriod': startPeriod,
      'endPeriod': endPeriod,
      'images': images,
      'description': description,
    };
  }
}

class ProjectModel {
  final String name;
  final String description;
  final String url;
  final List<String> images;
  final DateTime startPeriod;
  final DateTime endPeriod;

  ProjectModel({
    required this.name,
    required this.description,
    required this.url,
    required this.images,
    required this.startPeriod,
    required this.endPeriod,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      name: json['name'],
      description: json['description'],
      url: json['url'],
      images: List<String>.from(json['images']),
      startPeriod: (json['startPeriod'] as Timestamp).toDate(),
      endPeriod: (json['endPeriod'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'url': url,
      'images': images,
      'startPeriod': startPeriod,
      'endPeriod': endPeriod,
    };
  }
}

class CertificationModel {
  final String title;
  final List<String> images;
  final String url;
  final String validationPeriod;

  CertificationModel({
    required this.title,
    required this.validationPeriod,
    required this.images,
    required this.url,
  });

  factory CertificationModel.fromJson(Map<String, dynamic> json) {
    return CertificationModel(
      title: json['title'],
      images: (json['images'] as List).cast<String>(),
      validationPeriod: json['validationPeriod'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'images': images,
      'url': url,
      'validationPeriod': validationPeriod,
    };
  }
}

class CTFModel {
  final String difficulty;
  final List<String> images;
  final String name;
  final String url;

  CTFModel({
    required this.difficulty,
    required this.images,
    required this.name,
    required this.url,
  });

  factory CTFModel.fromJson(Map<String, dynamic> json) {
    return CTFModel(
      difficulty: json['difficulty'],
      images: (json['images'] as List).cast<String>(),
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'difficulty': difficulty,
      'images': images,
      'name': name,
      'url': url,
    };
  }
}
