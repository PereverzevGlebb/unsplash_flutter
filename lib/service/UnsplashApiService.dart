import 'package:flutter/foundation.dart';
import '../model/PhotoCardResult.dart';
import 'package:dio/dio.dart';

class UnsplashApiService {

  static String apiKey = "J1M1jvawKZIOLwWghWT0MF7ppMrIBDhcViUyN-F1ELk";

  String baseUrl = "https://api.unsplash.com";

  String searchIndex = "/search/";

  String feedQuery = "photos?query=random&per_page=30&client_id=$apiKey";

  String errorLogo = "https://www.computerhope.com/jargon/e/error.png";


  late Dio _dio;

  UnsplashApiService() {
    _dio = Dio();
  }

  Future<List<PhotoPostResult>?>? fetchRandomPhotos() async {
    try {
      Response response = await _dio.get(baseUrl + searchIndex + feedQuery);
      PhotoCardModel photoCardModel = PhotoCardModel.fromJson(response.data);
      return photoCardModel.results;
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  Future<List<PhotoPostResult>?> fetchSearchResult(String searchKey) async {
    try {
      Response response = await _dio.get(baseUrl + searchIndex + "photos?query=$searchKey&per_page=30&client_id=$apiKey");
      PhotoCardModel photoCardModel = PhotoCardModel.fromJson(response.data);
      return photoCardModel.results;
    } on DioError catch (e) {
      if (kDebugMode){
        print(e);
      }
    }
    return null;
  }
}