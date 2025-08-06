import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:urovo_print/urovo_print.dart';
import 'package:urovo_print/urovo_print_platform_interface.dart';
import 'package:urovo_print/urovo_print_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockUrovoPrintPlatform
    with MockPlatformInterfaceMixin
    implements UrovoPrintPlatform {
  @override
  Future<int?> clearPage() {
    // TODO: implement clearPage
    throw UnimplementedError();
  }

  @override
  Future<int?> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  Future<int?> drawBarcode(String data, int x, int y, int barcodetype, int width, int height, int rotate) {
    // TODO: implement drawBarcode
    throw UnimplementedError();
  }

  @override
  Future<int?> drawBitmap(Uint8List bmp, int xDest, int yDest) {
    // TODO: implement drawBitmap
    throw UnimplementedError();
  }

  @override
  Future<int?> drawLine(int x0, int y0, int x1, int y1, int lineWidth) {
    // TODO: implement drawLine
    throw UnimplementedError();
  }

  @override
  Future<int?> drawText(String data, int x, int y, String fontname, int fontsize, bool bold, bool italic, int rotate) {
    // TODO: implement drawText
    throw UnimplementedError();
  }

  @override
  Future<int?> drawTextEx(String data, int x, int y, int width, int height, String fontname, int fontsize, int rotate, int style, int format) {
    // TODO: implement drawTextEx
    throw UnimplementedError();
  }

  @override
  Future<int?> getStatus() {
    // TODO: implement getStatus
    throw UnimplementedError();
  }

  @override
  Future<int?> open() {
    // TODO: implement open
    throw UnimplementedError();
  }

  @override
  Future<int?> printPage(int rotate) {
    // TODO: implement printPage
    throw UnimplementedError();
  }

  @override
  Future<void> setGrayLevel(int level) {
    // TODO: implement setGrayLevel
    throw UnimplementedError();
  }

  @override
  Future<void> setSpeedLevel(int level) {
    // TODO: implement setSpeedLevel
    throw UnimplementedError();
  }

  @override
  Future<int?> setupPage(int width, int height) {
    // TODO: implement setupPage
    throw UnimplementedError();
  }
}

void main() {
  final UrovoPrintPlatform initialPlatform = UrovoPrintPlatform.instance;

  test('$MethodChannelUrovoPrint is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelUrovoPrint>());
  });

}
