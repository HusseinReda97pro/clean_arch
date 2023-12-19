import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final String? backdropPath;
  final int id;
  const Recommendation({required this.id, required this.backdropPath});
  @override
  List<Object?> get props => [backdropPath, id];
}
