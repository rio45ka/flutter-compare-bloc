import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tdlib/td_broadcaster.dart';
import 'package:tdlib/td_page_logic.dart';

class HomePageLogic extends TDPageLogic {
  final colorBroadcaster = TDBroadcaster<Color>(initValue: Colors.red);
  final countBroadcaster = TDBroadcaster<int>(initValue: 0);
  
  
  void actionChangeColor(Color color) {
    if (color == colorBroadcaster.value) return;

    colorBroadcaster.update(color);
  }

  void actionChangeNumber(bool increment) {
    int number = countBroadcaster.value;
    if (increment) {
      number++;
    } else {
      number--;
    }
    countBroadcaster.update(number);
  }


  @override
  void dispose() {
    colorBroadcaster.close();
    countBroadcaster.close();
  }

}