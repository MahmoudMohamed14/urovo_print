package com.example.urovo_print;

import android.device.PrinterManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** UrovosdkPlugin */
public class UrovoPrintPlugin implements FlutterPlugin, MethodCallHandler {

  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  private final String TAG = UrovoPrintPlugin.class.getSimpleName();

  private PrinterManager printManager;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "urovo_print");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {

    String method = call.method;
    Object arguments = call.arguments;
    log("onMethodCall=====method:" + method);
    log("onMethodCall=====arguments:" + arguments);

    if(printManager == null){
      printManager = new PrinterManager();
    }

    if (method.equals("clearPage")) {
      result.success(printManager.clearPage());
    }
    else if (method.equals("close")) {
      result.success(printManager.close());
    }
    else if (method.equals("drawBarcode")) {
      toDrawBarcode(call, result);
    }
    else if (method.equals("drawBitmap")) {
      toDrawBitmap(call, result);
    }
    /*else if (method.equals("drawBitmapEx")) {
      toDrawBitmapEx(call, result);
    }*/
    else if (method.equals("drawLine")) {
      toDrawLine(call, result);
    }
    else if (method.equals("drawText")) {
      toDrawText(call, result);
    }
    else if (method.equals("drawTextEx")) {
      toDrawTextEx(call, result);
    }
    else if (method.equals("getStatus")) {
      result.success(printManager.getStatus());
    }
    else if (method.equals("open")) {
      result.success(printManager.open());
    }
    else if (method.equals("printPage")) {
      toPrintPage(call, result);
    }
    else if (method.equals("setGrayLevel")) {
      toSetGrayLevel(call);
    }
    else if (method.equals("setSpeedLevel")) {
      toSetSpeedLevel(call);
    }
    else if (method.equals("setupPage")) {
      toSetupPage(call, result);
    }
    else {
      result.notImplemented();
    }
  }

  private void toSetupPage(MethodCall call, Result result) {

    Integer width = call.argument("width");
    Integer height = call.argument("height");
    result.success(printManager.setupPage(width, height));
  }

  private void toSetSpeedLevel(MethodCall call) {

    Integer level = call.argument("level");
    printManager.setSpeedLevel(level);
  }

  private void toSetGrayLevel(MethodCall call) {

    Integer level = call.argument("level");
    printManager.setGrayLevel(level);
  }

  private void toPrintPage(MethodCall call, Result result) {

    Integer rotate = call.argument("rotate");
    result.success(printManager.printPage(rotate));
  }

  private void toDrawTextEx(MethodCall call, Result result) {

    String data = call.argument("data");
    Integer x = call.argument("x");
    Integer y = call.argument("y");
    Integer width = call.argument("width");
    Integer height = call.argument("height");
    String fontname = call.argument("fontname");
    Integer fontsize = call.argument("fontsize");
    Integer rotate = call.argument("rotate");
    Integer style = call.argument("style");
    Integer format = call.argument("format");
    result.success(printManager.drawTextEx(data, x, y, width, height, fontname,
            fontsize, rotate, style, format));
  }

  private void toDrawText(MethodCall call, Result result) {

    String data = call.argument("data");
    Integer x = call.argument("x");
    Integer y = call.argument("y");
    String fontname = call.argument("fontname");
    Integer fontsize = call.argument("fontsize");
    boolean bold = call.argument("bold");
    boolean italic = call.argument("italic");
    Integer rotate = call.argument("rotate");
    result.success(printManager.drawText(data, x, y, fontname, fontsize, bold, italic, rotate));
  }

  private void toDrawLine(MethodCall call, Result result) {

    Integer x0 = call.argument("x0");
    Integer y0 = call.argument("y0");
    Integer x1 = call.argument("x1");
    Integer y1 = call.argument("y1");
    Integer lineWidth = call.argument("lineWidth");
    result.success(printManager.drawLine(x0, y0, x1, y1, lineWidth));
  }

  private void toDrawBitmap(MethodCall call, Result result) {

    byte[] pbmp = call.argument("bmp");
    Bitmap bitmap = BitmapFactory.decodeByteArray(pbmp, 0 , pbmp.length);
    Integer xDest = call.argument("xDest");
    Integer yDest = call.argument("yDest");
    result.success(printManager.drawBitmap(bitmap, xDest, yDest));
  }

  private void toDrawBarcode(MethodCall call, Result result) {

    String data = call.argument("data");
    Integer x = call.argument("x");
    Integer y = call.argument("y");
    Integer barcodetype = call.argument("barcodetype");
    Integer width = call.argument("width");
    Integer height = call.argument("height");
    Integer rotate = call.argument("rotate");
    result.success(printManager.drawBarcode(data, x, y, barcodetype, width, height, rotate));
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  private void log(String s) {
    Log.d(TAG, ">> " + s);
  }

}
