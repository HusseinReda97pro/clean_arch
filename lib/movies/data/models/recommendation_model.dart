import 'package:clean_arch/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({required super.id, super.backdropPath});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      id: json['id'],
      backdropPath:
          json['backdrop_path'] ?? ' /ta17TttHGdZ5PZz60UD3N5BRYJ&.jpg',
    );
  }
}
