import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingProgress{
  static inProgress(Function function) async{
    await EasyLoading.show(status: 'loading...');
    await function();
    await EasyLoading.dismiss();
  }
}

