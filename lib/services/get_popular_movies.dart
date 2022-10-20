import 'package:dio/dio.dart';
import 'package:practical_test/utils/api_routes.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class GetMoviesService {
  Dio? dio;

  GetMoviesService() {
    dio = Dio();
    dio!
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = 30000
      ..options.receiveTimeout = 3000
      ..httpClientAdapter;

    dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }

  Future<Response> getPopularMovies() async {
    Response? response;

    try {
      dio!.options.headers.addAll({'Accept': 'application/json'});

      response = await dio!.get(
        "${AppConstants.popularMovies}?api_key=$apiKey",
      );
    } on DioError {
      rethrow;
    } catch (e) {
      rethrow;
    }
    return response;
  }

  Future<Response> getNowPlayingMovies() async {
    Response? response;

    try {
      dio!.options.headers.addAll({'Accept': 'application/json'});

      response = await dio!.get(
        "${AppConstants.nowPlayingMovies}?api_key=$apiKey",
      );
    } on DioError {
      rethrow;
    } catch (e) {
      rethrow;
    }
    return response;
  }

  Future<Response> getTopRatedMovies() async {
    Response? response;

    try {
      dio!.options.headers.addAll({'Accept': 'application/json'});

      response = await dio!.get(
        "${AppConstants.topRatedMovies}?api_key=$apiKey",
      );
    } on DioError {
      rethrow;
    } catch (e) {
      rethrow;
    }
    return response;
  }

  Future<Response> getUpcomingMovies() async {
    Response? response;

    try {
      dio!.options.headers.addAll({'Accept': 'application/json'});

      response = await dio!.get(
        "${AppConstants.upcomingMovies}?api_key=$apiKey",
      );
    } on DioError {
      rethrow;
    } catch (e) {
      rethrow;
    }
    return response;
  }

}
