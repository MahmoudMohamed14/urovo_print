import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:urovo_print/urovo_print.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _urovoPrintPlugin = UrovoPrint();
  String _msg = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: Column(
                children: [
                  Text('msg: ${_msg ?? ""}\n'),
                  ElevatedButton(
                      onPressed: printData,
                      child: const Text("Print Test")),
                  ElevatedButton(
                      onPressed: printSetting,
                      child: const Text("Print Settings")),
                ]
            )
        ),
      ),
    );
  }

  void printData() async {

    // ----------------- Print initialization starts
    var msg = await _urovoPrintPlugin.open();
    if(msg != 0){
      setState(() { _msg = 'open result:$msg'; });
      return;
    }

    msg = await _urovoPrintPlugin.getStatus();
    if(msg != 0){
      setState(() { _msg = 'Status result:$msg'; });
      return;
    }
    // ----------------- End of printing initialization



    // ----------------- Add print content to get started
    msg = await _urovoPrintPlugin.setupPage(384, -1);
    if(msg != 0){
      setState(() { _msg = 'setupPage result:$msg';  });
      return;
    }

    int x = 0;
    int y = 0;
    int index = 5;

    msg = await _urovoPrintPlugin.drawText("Hello world", x, y, "simsun", 26, false, false, 0);
    if(msg == -1){
      setState(() { _msg = 'drawText1 result:$msg';  });
      return;
    }

    y = y + index + msg!;
    msg = await _urovoPrintPlugin.drawText("TEST", x, y, "simsun", 36, false, false, 0);
    if(msg == -1){
      setState(() { _msg = 'drawText2 result:$msg';  });
      return;
    }

    y = y + index + msg!;
    msg = await _urovoPrintPlugin.drawLine(x, y, 300, y, 6);
    if(msg == -1){
      setState(() { _msg = 'drawLine result:$msg';  });
      return;
    }

    y = y + index + 20;
    msg = await _urovoPrintPlugin.drawBarcode("ABCDEF", x, y, 20, 3, 80, 0);
    if(msg == -1){
      setState(() { _msg = 'drawBarcode result:$msg';  });
      return;
    }

    y = y + index + msg! + 100;
    Uint8List pbmp = await loadImageFromAssets('packages/urovo_print/images/ham.png');
    msg = await _urovoPrintPlugin.drawBitmap(pbmp, x, y);
    if(msg == -1){
      setState(() { _msg = 'drawBitmap result:$msg';  });
      return;
    }

    for (var i = 0; i < 3; i++) {
      y = y + index + msg! + 30;
      msg = await _urovoPrintPlugin.drawText(" ", x, y, "simsun", 30, false, false, 0);
    }
    // ----------------- End of adding print content



    // ----------------- start printing
    msg = await _urovoPrintPlugin.printPage(0);
    if(msg != 0){
      setState(() { _msg = 'printPage result:$msg';  });
      return;
    }
    // ----------------- end printing



    // ----------------- Release resources after printing
    msg = await _urovoPrintPlugin.setupPage(-1, -1);
    if(msg != 0){
      setState(() { _msg = 'setupPage result:$msg';  });
      return;
    }

    msg = await _urovoPrintPlugin.clearPage();
    if(msg != 0){
      setState(() { _msg = 'clearPage result:$msg';  });
      return;
    }

    msg = await _urovoPrintPlugin.close();
    if(msg != 0){
      setState(() { _msg = 'close result:$msg';  });
      return;
    }
    // ----------------- Release resources after printing
    setState(() { _msg = 'print end:'; });
  }

  void printSetting() async {
    // Set print gray level.
    _urovoPrintPlugin.setGrayLevel(1);
    // Set print speed level.
    _urovoPrintPlugin.setSpeedLevel(0);
  }

  Future<Uint8List> loadImageFromAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    return data.buffer.asUint8List();
  }
}
