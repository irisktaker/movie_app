class ApiConstance {
  static const String baseURL = "https://api.themoviedb.org/3";
  static const String apiKey = "2936f48f8c17a44a4c13e4f4b2c5111a";
  static const String nowPlayingMoviePath = "$baseURL/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath = "$baseURL/movie/popular?api_key=$apiKey";
  static const String topRatedMoviePath = "$baseURL/movie/top_rated?api_key=$apiKey";
  static String movieDetailPath(int movieId) => "$baseURL/movie/$movieId?api_key=$apiKey";
  static String movieRecommendationPath(int movieId) => "$baseURL/movie/$movieId/recommendations?api_key=$apiKey";
  
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) => "$baseImageUrl$path";
}
