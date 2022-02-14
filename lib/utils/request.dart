import 'package:dio/dio.dart';

Future httpGet() async {
  var dio = Dio();
  final response = await dio.get('https://httpbin.org/ip');
  print(response.data);
}
