// ignore_for_file: unused_local_variable

import 'package:dental_app/data/vos/time_vo.dart';
import 'package:dental_app/dummy/time_data.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class HomeBloc extends ChangeNotifier {
  // ChangeNotifier must be imported from flutter foundation

  // States
  List<TimeVO> timeData1 = timeData;
  List<TimeVO> refreshList = [];
  bool loading = false;

  /// Models

  HomeBloc() {
    var now = DateTime.now();

    int? currentTime = 0;
    currentTime = int.parse(DateFormat('HH:mm').format(now).substring(0, 2));
    // currentTime = 10;
    int? sTime;
    int? eTime;
    for (var element in timeData1) {
      sTime = int.parse(element.startTime?.substring(0, 2) ?? "");
      eTime = int.parse(element.endTime?.substring(0, 2) ?? "");

      if (eTime < currentTime) {
        element.isCurrentTime = false;
      } else {
        element.isCurrentTime = true;
      }
      if (eTime < currentTime) {
        element.showCircle = false;
      } else {
        element.showCircle = true;
        break;
      }
    }
  }
  // List<TimeVO> setTimeData(List<TimeVO> timeData) {
  //   return timeData;
  // }

  // Future<bool> getRefreshList() async {
  //   // timeData1 = timeData1;
  //   return true;
  // }
  showLoading() {
    loading = true;
    notifyListeners();
  }

  notShowLoading() {
    loading = false;
    notifyListeners();
  }
}
