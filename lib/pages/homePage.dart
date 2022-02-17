import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tpl/components/button/button.dart';
import 'package:flutter_tpl/models/test.dart';
import 'package:flutter_tpl/request/request.dart';
import 'package:flutter_tpl/request2/http_request.dart';
import 'package:flutter_tpl/utils/storage.dart';

import 'package:flutter_tpl/utils/util.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String test;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    test = SpUtil().localGet("test") ?? "";
  }

  final Map mp = {"1": "首页", "2": "我的"};

  void fun() {
    print("21312321");
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.red,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.red,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(["首页", "我的"][0]),
          backgroundColor: Colors.amberAccent,
        ),
        body: Center(
            child: Column(
          children: [
            Text(
              "首页$test",
              style: TextStyle(color: Utils.color("#027AFF")),
            ),
            ElButton(
              "text",
              onPressed: fun,
            ),
            ElevatedButton(
                onPressed: () async {
                  // httpGet();
                  // dynamic response = await HttpUtils.get(
                  //     '/api/account/test');
                  // print(VideoSearch.fromJson(response['data']).name);

                  dynamic response = await get("/api/account/test");
                  print(response);
                },
                child: const Text("GET请求")),
            ElevatedButton(
                onPressed: () async {
                  dynamic response = await post("/api/account/post",
                      data: {"ds": SpUtil().localGet("token")});
                  print(response);
                },
                child: const Text("POST请求")),
            OutlinedButton(
                onPressed: () async {
                  // print(SpUtil() == SpUtil());
                  setState(() {
                    SpUtil().localSet("test", "我是缓存内容1");
                    SpUtil().localSet("token", "fafdafadfer234ewf2");
                  });
                },
                child: const Text("设置缓存")),
          ],
        )),
      ),
    );
  }
}

class Htt {
  Htt();
}
