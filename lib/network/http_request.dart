import 'package:dio/dio.dart';
import 'http_config.dart';

class HttpRequestTest {
  //1.创建DIO实例
/* static BaseOptions baseOptions = BaseOptions(
      baseUrl: BASE_URL,
      connectTimeout: TIMEOUT
  );*/

 // static final dio = Dio(baseOptions);

 static Future request(String url,
      {String method = "get", Map<String, dynamic>? params})async {

   //2.发送网络请求
   // Options options = Options(method: method);
   try {
     /*final result = await dio.request(
         url, queryParameters: params, options: options).then((value) {
     });*/
     Response response = await Dio().get(url);
     return response.data;
   }on DioError catch(err){
     rethrow;
   }
 }
}


