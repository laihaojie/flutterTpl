import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tpl/pages/chars.dart';
import 'package:flutter_tpl/pages/detail.dart';
import 'package:flutter_tpl/pages/homePage.dart';
import 'package:flutter_tpl/pages/myPage.dart';

import 'i_router.dart';
import 'not_found_page.dart';

class Routes {
  static String webViewPage = '/webView';
  static String home = '/home';
  static String me = '/me';
  static String charts = '/charts';
  static String detail = '/detail';

  static final List<IRouterProvider> _listRouter = [];

  static final FluroRouter router = FluroRouter();

  static void initRoutes() {
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      debugPrint('未找到目标页');
      return const NotFoundPage();
    });

    router.define(
      home,
      handler: Handler(
        handlerFunc:
            (BuildContext? context, Map<String, List<String>> params) =>
                const HomePage(),
      ),
    );
    router.define(
      me,
      handler: Handler(
        handlerFunc:
            (BuildContext? context, Map<String, List<String>> params) =>
                MyPage(),
      ),
    );

    router.define(
      charts,
      handler: Handler(
        handlerFunc:
            (BuildContext? context, Map<String, List<String>> params) =>
                ChartPage1(),
      ),
    );
    
    router.define(
      detail,
      handler: Handler(
        handlerFunc:
            (BuildContext? context, Map<String, List<String>> params) =>
                DetailPage(),
      ),
    );

    // router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
    //   final String title = params['title']?.first ?? '';
    //   final String url = params['url']?.first ?? '';
    //   return WebViewPage(title: title, url: url);
    // }));

    // _listRouter.clear();
    // /// 各自路由由各自模块管理，统一在此添加初始化
    // _listRouter.add(ShopRouter());
    // _listRouter.add(LoginRouter());
    // _listRouter.add(GoodsRouter());
    // _listRouter.add(OrderRouter());
    // _listRouter.add(StoreRouter());
    // _listRouter.add(AccountRouter());
    // _listRouter.add(SettingRouter());
    // _listRouter.add(StatisticsRouter());

    // /// 初始化路由
    // void initRouter(IRouterProvider routerProvider) {
    //   routerProvider.initRouter(router);
    // }
    // _listRouter.forEach(initRouter);
  }
}
