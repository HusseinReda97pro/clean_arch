class ApiConstants {
  static const String apiKey = "1b7c1a5a0cb65e8ddd82363f6088151f";
  // the tv movie database
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String nowPlayingPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String popularPath = "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  static String movieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";

  static String movieRecommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => "$baseImageUrl$path";
}
