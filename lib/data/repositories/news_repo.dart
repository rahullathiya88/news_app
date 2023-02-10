import 'package:dio/dio.dart';
import 'package:news_app/data/api/api_result.dart';
import 'package:news_app/data/api/network_exception.dart';
import 'package:news_app/data/http/http_client.dart';
import 'package:news_app/data/models/news_model.dart';

class NewsRepo {
  static NewsRepo? _instance;

  static NewsRepo get instance => _instance ??= NewsRepo._();

  NewsRepo._();
  NewsModel? newsModel;
  static final ApiHelper _apiHelper = ApiHelper();

  Future<ApiResult<NewsModel>> getStudioDetails(
      {required String category}) async {
    try {
      Response result = await _apiHelper.getRequest(category);
      print('RESULT=======${result.data}');
      if (result.data["success"] == true) {
        newsModel = NewsModel.fromJson(result.data);
        return ApiResult.success(data: newsModel!);
      } else {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data["success"]));
      }
    } catch (e) {
      print('RESULT=======FAIL');
      return ApiResult.failure(
          error: NetworkExceptions.defaultError(e.toString()));
    }
  }
}
