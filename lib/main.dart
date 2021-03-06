import 'package:flutter/material.dart';
import 'package:flutter_tpl/bottomNavigation.dart';
import 'package:flutter_tpl/pages/myPage.dart';
import 'package:flutter_tpl/routers/routers.dart';
import 'package:flutter_tpl/utils/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initStore();
  runApp(MyApp());
}

Future<void> initStore() async {
  // 初始化本地存储类d
  await SpUtil().init();
  // 初始化request类
  // HttpUtils.init(
  //   baseUrl: App.baseUrl,
  // );
  // 全局注入
  // print("全局注入");
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    Routes.initRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const BottomNavigationWidget(),
      onGenerateRoute: Routes.router.generator,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MyPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
