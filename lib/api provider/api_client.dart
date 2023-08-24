import 'package:dio/dio.dart';
class Client{
  Dio init(){
    Dio _dio = Dio();
    _dio.interceptors.add(ApiInterceptor());
    _dio.options.baseUrl = 'http://13.233.114.64:8000/';
    // _dio.options.baseUrl = 'https://r-education.herokuapp.com/';
    return _dio;
  }
}

class ApiInterceptor extends Interceptor{


@override
  void onError(DioError err, ErrorInterceptorHandler handler) {
   
    super.onError(err, handler);
  }
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
   
    super.onResponse(response, handler);
  }
}