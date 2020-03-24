import 'package:dio/dio.dart';
import 'http_config.dart';

class HttpRequest {

  static final BaseOptions options = BaseOptions(
    baseUrl: HttpConfig.baseURL,
    connectTimeout: HttpConfig.timeOut
  );

  static final Dio dio = Dio(options);

  static Future<T> request<T>(String url,
      {
        String method = 'get',
        Map<String, dynamic> params,
        Interceptor inter,
      }) async {

    //请求的单独配置
    final options = Options(method: method);

    // 添加全局的拦截器
    Interceptor interceptor = InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        print("请求拦截");
        return options;
      },

      onResponse: (Response response) {
        print("响应拦截");
        return response;
      },

      onError: (DioError error) {
        print("错误拦截");
        return error;
      },
    );

    List<Interceptor> inters = [interceptor];

    if (inter != null) {
      inters.add(inter);
    }

    dio.interceptors.addAll(inters);

    // 发送请求
    try {

      Response response = await dio.request(url, queryParameters: params, options: options);
      return response.data;

    } on DioError catch(error) {
      return Future.error(error);
    }
  }
}