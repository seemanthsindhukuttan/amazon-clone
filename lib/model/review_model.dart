import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewModel {
  final String reviewerName;
  final String description;
  final double rating;

  ReviewModel({
    required this.reviewerName,
    required this.description,
    required this.rating,
  });

  Map<String, dynamic> toJson() {
    return {
      'reviewerName': reviewerName,
      'description': description,
      'rating': rating,
    };
  }

  factory ReviewModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return ReviewModel(
      description: json['description'],
      rating: json['rating'],
      reviewerName: json['reviewerName'],
    );
  }
}
