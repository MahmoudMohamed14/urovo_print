import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'urovo_print_platform_interface.dart';

/// An implementation of [UrovoPrintPlatform] that uses method channels.
class MethodChannelUrovoPrint extends UrovoPrintPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('urovo_print');


  @override
  Future<int?> clearPage() async {
    return await methodChannel.invokeMethod<int>('clearPage');
  }

  @override
  Future<int?> close() async {
    return await methodChannel.invokeMethod<int>('close');
  }

  @override
  Future<int?> drawBarcode(String data, int x, int y, int barcodetype, int width, int height, int rotate) async {
    Map<String, dynamic> param = <String, dynamic>{};
    param['data'] = data;
    param['x'] = x;
    param['y'] = y;
    param['barcodetype'] = barcodetype;
    param['width'] = width;
    param['height'] = height;
    param['rotate'] = rotate;
    return await methodChannel.invokeMethod<int>('drawBarcode', param);
  }

  @override
  Future<int?> drawBitmap(Uint8List bmp, int xDest, int yDest) async {
    Map<String, dynamic> param = <String, dynamic>{};
    param['bmp'] = bmp;
    param['xDest'] = xDest;
    param['yDest'] = yDest;
    return await methodChannel.invokeMethod<int>('drawBitmap', param);
  }

  /*@override
  Future<int?> drawBitmapEx(Uint8List pbmp, int xDest, int yDest, int widthDest, int heightDest) async {
    Map<String, dynamic> param = <String, dynamic>{};
    param['pbmp'] = pbmp;
    param['xDest'] = xDest;
    param['yDest'] = yDest;
    param['widthDest'] = widthDest;
    param['heightDest'] = heightDest;
    return await methodChannel.invokeMethod<int>('drawBitmapEx', param);
  }*/

  @override
  Future<int?> drawLine(int x0, int y0, int x1, int y1, int lineWidth) async {
    Map<String, dynamic> param = <String, dynamic>{};
    param['x0'] = x0;
    param['y0'] = y0;
    param['x1'] = x1;
    param['y1'] = y1;
    param['lineWidth'] = lineWidth;
    return await methodChannel.invokeMethod<int>('drawLine', param);
  }

  @override
  Future<int?> drawText(String data, int x, int y, String fontname, int fontsize, bool bold, bool italic, int rotate) async {
    Map<String, dynamic> param = <String, dynamic>{};
    param['data'] = data;
    param['x'] = x;
    param['y'] = y;
    param['fontname'] = fontname;
    param['fontsize'] = fontsize;
    param['bold'] = bold;
    param['italic'] = italic;
    param['rotate'] = rotate;
    return await methodChannel.invokeMethod<int>('drawText', param);
  }

  @override
  Future<int?> drawTextEx(String data, int x, int y, int width, int height, String fontname, int fontsize, int rotate, int style, int format) async {
    Map<String, dynamic> param = <String, dynamic>{};
    param['data'] = data;
    param['x'] = x;
    param['y'] = y;
    param['width'] = width;
    param['height'] = height;
    param['fontname'] = fontname;
    param['fontsize'] = fontsize;
    param['rotate'] = rotate;
    param['style'] = style;
    param['format'] = format;
    return await methodChannel.invokeMethod<int>('drawTextEx', param);
  }

  @override
  Future<int?> getStatus() async {
    return await methodChannel.invokeMethod<int>('getStatus');
  }

  @override
  Future<int?> open() async {
    return await methodChannel.invokeMethod<int>('open');
  }

  @override
  Future<int?> printPage(int rotate) async {
    Map<String, dynamic> param = <String, dynamic>{};
    param['rotate'] = rotate;
    return await methodChannel.invokeMethod<int>('printPage', param);
  }

  @override
  Future<void> setGrayLevel(int level) async {
    Map<String, dynamic> param = <String, dynamic>{};
    param['level'] = level;
    return methodChannel.invokeMethod('setGrayLevel', param);
  }

  @override
  Future<void> setSpeedLevel(int level) async {
    Map<String, dynamic> param = <String, dynamic>{};
    param['level'] = level;
    return methodChannel.invokeMethod('setSpeedLevel', param);
  }

  @override
  Future<int?> setupPage(int width, int height) async {
    Map<String, dynamic> param = <String, dynamic>{};
    param['width'] = width;
    param['height'] = height;
    return await methodChannel.invokeMethod<int>('setupPage', param);
  }
}
