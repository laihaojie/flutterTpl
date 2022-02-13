import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tpl/components/button/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            const Text("首页"),
            ElButton(
              "text",
              onPressed: fun,
              width: 200,
            )
          ],
        )),
      ),
    );
  }
}
