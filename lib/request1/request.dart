import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'exception.dart';
import 'exception_handler.dart';

Future request(
  Function() block, {
  bool showLoading = true,
  bool Function(ApiException)? onError,
}) async {
  try {
    await loading(block, isShowLoading: showLoading);
  } catch (e) {
    handleException(ApiException.from(e), onError: onError);
  }
  return;
}

Future loading(Function block, {bool isShowLoading = true}) async {
  if (isShowLoading) {
    showLoading();
  }
  try {
    await block();
  } catch (e) {
    rethrow;
  } finally {
    dismissLoading();
  }
  return;
}

void showLoading() {
  EasyLoading.show(status: "加载中...");
}

void dismissLoading() {
  EasyLoading.dismiss();
}
