import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tpl/models/apiResponse.dart';
import 'package:flutter_tpl/utils/constant.dart';
import 'package:flutter_tpl/utils/util.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'requestInterceptor.dart';

class Http {
  static final Http _instance = Http._internal();
  factory Http() => _instance;

  static late final Dio dio;

  List<CancelToken?> pendingRequest = [];

  Http._internal() {
    BaseOptions options = BaseOptions();

    dio = Dio(options);
    dio.options.baseUrl = App.baseUrl;
    // 添加request拦截器
    dio.interceptors.add(RequestInterceptor());
  }
  Future request(
    String path, {
    String method = "GET",
    Map<String, dynamic>? params,
    data,
    Options? options,
    CancelToken? cancelToken,
    bool refresh = false,
    bool noCache = true,
    String? cacheKey,
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions = requestOptions.copyWith(
      method: method,
      extra: {
        "refresh": refresh,
        "noCache": noCache,
        "cacheKey": cacheKey,
        "cacheDisk": cacheDisk,
      },
    );

    Response response;
    CancelToken dioCancelToken = createDioCancelToken(cancelToken);
    response = await dio.request(
      path,
      data: data,
      queryParameters: params,
      options: requestOptions,
      cancelToken: dioCancelToken,
    );
    pendingRequest.remove(dioCancelToken);

    ApiResponse result;

    if (response.data != null) {
      result = ApiResponse.fromJson(response.data);
    } else {
      return response.data;
    }

    if (result.code == 1) {
      return result.data;
    }
    if (result.code == 401) {
      // ignore: todo
      // TODO 401
      throw "";
    }
    if (result.code != null) {
      Fluttertoast.showToast(
          msg: "服务器繁忙",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Utils.cl("#ccc"),
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return response.data;
  }

  Future get(
    String path, {
    Map<String, dynamic>? params,
  }) async {
    return request(path, params: params);
  }

  Future post(
    String path, {
    Map<String, dynamic>? params,
    data,
  }) async {
    return request(
      path,
      method: "POST",
      params: params,
      data: data,
    );
  }

  // 获取cancelToken , 根据传入的参数查看使用者是否有动态传入cancel，没有就生成一个
  CancelToken createDioCancelToken(CancelToken? cancelToken) {
    CancelToken token = cancelToken ?? CancelToken();
    pendingRequest.add(token);
    return token;
  }

  _convertRequestData(data) {
    if (data != null) {
      data = jsonDecode(jsonEncode(data));
    }
    return data;
  }
}

class ApiResponse {
  int? code;
  dynamic data;
  String? message;

  ApiResponse({this.code, this.data, this.message});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['data'] = this.data;
    data['message'] = message;
    return data;
  }
}

Future get(String path, {Map<String, dynamic>? params}) {
  return Http().get(path, params: params);
}
