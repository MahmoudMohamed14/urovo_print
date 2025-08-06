import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'urovo_print_method_channel.dart';

abstract class UrovoPrintPlatform extends PlatformInterface {
  /// Constructs a UrovoPrintPlatform.
  UrovoPrintPlatform() : super(token: _token);

  static final Object _token = Object();

  static UrovoPrintPlatform _instance = MethodChannelUrovoPrint();

  /// The default instance of [UrovoPrintPlatform] to use.
  ///
  /// Defaults to [MethodChannelUrovoPrint].
  static UrovoPrintPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UrovoPrintPlatform] when
  /// they register themselves.
  static set instance(UrovoPrintPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int?> clearPage() {
    throw UnimplementedError('clearPage() has not been implemented.');
  }

  Future<int?> close() {
    throw UnimplementedError('close() has not been implemented.');
  }

  Future<int?> drawBarcode(String data, int x, int y, int barcodetype, int width, int height, int rotate) {
    throw UnimplementedError('drawBarcode() has not been implemented.');
  }

  Future<int?> drawBitmap(Uint8List bmp, int xDest, int yDest) {
    throw UnimplementedError('drawBitmap() has not been implemented.');
  }

  /*Future<int?> drawBitmapEx(Uint8List pbmp, int xDest, int yDest, int widthDest, int heightDest) {
    throw UnimplementedError('drawBitmapEx() has not been implemented.');
  }*/

  Future<int?> drawLine(int x0, int y0, int x1, int y1, int lineWidth) {
    throw UnimplementedError('drawLine() has not been implemented.');
  }

  Future<int?> drawText(String data, int x, int y, String fontname, int fontsize, bool bold, bool italic, int rotate) {
    throw UnimplementedError('drawText() has not been implemented.');
  }

  Future<int?> drawTextEx(String data, int x, int y, int width, int height, String fontname, int fontsize, int rotate, int style, int format) {
    throw UnimplementedError('drawTextEx() has not been implemented.');
  }

  Future<int?> getStatus() {
    throw UnimplementedError('getStatus() has not been implemented.');
  }

  Future<int?> open() {
    throw UnimplementedError('open() has not been implemented.');
  }

  Future<int?> printPage(int rotate) {
    throw UnimplementedError('printPage() has not been implemented.');
  }

  Future<void> setGrayLevel(int level) async {
    throw UnimplementedError('setGrayLevel() has not been implemented.');
  }

  Future<void> setSpeedLevel(int level) async {
    throw UnimplementedError('setSpeedLevel() has not been implemented.');
  }

  Future<int?> setupPage(int width, int height) {
    throw UnimplementedError('setupPage() has not been implemented.');
  }
}
