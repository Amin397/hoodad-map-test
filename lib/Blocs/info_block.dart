import 'dart:async';

import 'package:untitled1/Models/User/user_info_model.dart';


class InfoBloc {
  // ignore: close_sinks
  final streamController = StreamController.broadcast();

  /// The [getStream] getter would be used to expose our stream to other classes
  Stream get getStream => streamController.stream;

  UserInfoModel? info;

  setData({
    required UserInfoModel infoData,
  }) {
    info = infoData;
    sync();
  }

  sync() {
    streamController.sink.add(info);
  }

}
