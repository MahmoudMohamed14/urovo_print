
import 'dart:typed_data';

import 'urovo_print_platform_interface.dart';

class UrovoPrint {

  /**
   *  Clear the current page.
   *
   *  Parameters:
   *  none
   *
   *  Returns:
   *  0 if successful, -1 if failed.
   * */
  Future<int?> clearPage() {
    return UrovoPrintPlatform.instance.clearPage();
  }

  /**
   *  Close the printer.
   *
   *  Parameters:
   *  none
   *
   *  Returns:
   *  0 if open successful, -1 if failed.
   * */
  Future<int?> close() {
    return UrovoPrintPlatform.instance.close();
  }

  /**
   *  Draw barcode on the current page.
   *
   *  Parameters:
   *  data - The barcode text.
   *  x - Start point at X axis.
   *  y - Start point at Y axis.
   *  barcodeType - Following Table shows the supported symbology:
   *  width - There are four thickness level to the lines, 1 being the thinnest and 4 being the thickest.
   *  height - The barcode height in pixel.
   *  rotate - The barcode rotation, Value:
   *   0 : no rotation
   *   1 : rotate 90 degree
   *   2 : rotate 180 degree
   *   3 : rotate 270 degree
   *
   *   Returns:
   *   Actual printing height if successful, -1 if failed.
   * */
  Future<int?> drawBarcode(String data, int x, int y, int barcodetype, int width,
      int height, int rotate) {
    return UrovoPrintPlatform.instance.drawBarcode(data, x, y, barcodetype, width, height, rotate);
  }

  /**
   * Draw a bitmap on the current page.
   *
   * Parameters:
   *   bmp - ByteArray data for mono-bitmaps.
   *   xDest - Start point at X axis.
   *   yDest - Start point at Y axis.
   *
   *   Returns:
   *   Actual printing height is successful, -1 if failed.
   * */
  Future<int?> drawBitmap(Uint8List bmp, int xDest, int yDest) {
    return UrovoPrintPlatform.instance.drawBitmap(bmp, xDest, yDest);
  }

  /*Future<int?> drawBitmapEx(Uint8List pbmp, int xDest, int yDest, int widthDest, int heightDest) {
    return UrovoPrintPlatform.instance.drawBitmapEx(pbmp, xDest, yDest, widthDest, heightDest);
  }*/


  /**
   * Draw a line in the current page. The (0,0) point axis is on the upper left corner of the screen.
   *
   * Parameters:
   *   x0 - Start point X axis.
   *   y0 - Start point Y axis.
   *   x1 - End point X axis.
   *   y1 - End point Y axis.
   *   lineWidth - In pixel. 8 pixels is equivalent to 1 mm.
   *
   *   Returns:
   *   0 if successful, -1 if failed.
   * */
  Future<int?> drawLine(int x0, int y0, int x1, int y1, int lineWidth) {
    return UrovoPrintPlatform.instance.drawLine(x0, y0, x1, y1, lineWidth);
  }

  /**
   * Draw text on the current page.
   *
   * Parameters:
   *   data - The string to draw.
   *   x - Start point X axis.
   *   y - Start point Y axis.
   *   fontName - Font to use, otherwise, default system font will be used. Custom fonts can be specified, for example, specifying the full path /mnt/sdcard/xxx.ttf.
   *   fontSize - The font size, in pixel.
   *   bold - Set font style to bold.
   *   italic - Set font style to italic.
   *   rotate - The text direction. Value:
   *   0 : no rotation
   *   1 : rotate 90 degree
   *   2 : rotate 180 degree
   *   3 : rotate 270 degree
   *
   *   Returns:
   *   Actual printing height if successful, -1 if failed.
   * */
  Future<int?> drawText(String data, int x, int y, String fontname, int fontsize, bool bold,
      bool italic, int rotate) {
    return UrovoPrintPlatform.instance.drawText(data, x, y, fontname, fontsize, bold, italic, rotate);
  }

  /**
   * Draw text on the current page.
   *
   * Parameters:
   *   data - The string to draw.
   *   x - Start point X axis.
   *   y - Start point Y axis.
   *   width - Text is printed to the width of a rectangle on the page.
   *   height - Text is printed to the height of a rectangle on the page.
   *   fontName - Font to use, otherwise, default system font will be used. Or custom fonts i.e. /mnt/sdcard/xxx.ttf the path.
   *   fontSize - The font size, in pixel.
   *   rotate - Print the text rotated to requested degress. Value:
   *   0 : no rotation
   *   1 : rotate 90 degree
   *   2 : rotate 180 degree
   *   3 : rotate 270 degree
   *   style - Font style of value:
   *   0x0001 : underline
   *   0x0002 : italic
   *   0x0004 : bold
   *   0x0008 : reverse effect
   *   0x0010 : strike out
   *   you can mix the style by using the or operator, style= 0x0002|0x0004.
   *   format - Set to 0 means word wrap at the specified width range 0 to 384, set to 1 means no word wrap.
   *
   *   Returns:
   *   Actual printing height if successful, -1 if failed.
   * */
  Future<int?> drawTextEx(String data, int x, int y, int width, int height, String fontname,
      int fontsize, int rotate, int style, int format) {
    return UrovoPrintPlatform.instance.drawTextEx(data, x, y, width, height, fontname, fontsize,
        rotate, style, format);
  }

  /**
   * Get the current state of the printer.
   *
   *   Parameters:
   *   none
   *
   *   Returns:
   *   The printer status. See
   *   PRNSTS_BUSY	-4
   *   PRNSTS_ERR	-256
   *   PRNSTS_ERR_DRIVER	-257
   *   PRNSTS_OK	0
   *   PRNSTS_OUT_OF_PAPER	-1
   *   PRNSTS_OVER_HEAT	-2
   *   PRNSTS_UNDER_VOLTAGE	-3
   * */
  Future<int?> getStatus() {
    return UrovoPrintPlatform.instance.getStatus();
  }

  /**
   *  Opens the printer.
   *
   *  Parameters:
   *  none
   *
   *  Returns:
   *  0 if open successful, -1 if failed.
   * */
  Future<int?> open() {
    return UrovoPrintPlatform.instance.open();
  }

  /**
   * Print the current page.
   *
   *   Parameters:
   *   rotate - The rotation angle, currently supports only 0 (non-rotating)
   *
   *   Returns:
   *   The printer status. See
   *   PRNSTS_BUSY	-4
   *   PRNSTS_ERR	-256
   *   PRNSTS_ERR_DRIVER	-257
   *   PRNSTS_OK	0
   *   PRNSTS_OUT_OF_PAPER	-1
   *   PRNSTS_OVER_HEAT	-2
   *   PRNSTS_UNDER_VOLTAGE	-3
   * */
  Future<int?> printPage(int rotate) {
    return UrovoPrintPlatform.instance.printPage(rotate);
  }

  /**
   * Set print gray level.
   *   Parameters:
   *   level - The range of Gray level is 0 to 4. The default value is 0.
   *
   *   Returns:
   *   none
   * */
  Future<void> setGrayLevel(int level) async {
    return UrovoPrintPlatform.instance.setGrayLevel(level);
  }

  /**
   * Set print speed level.
   *   Parameters:
   *   level - The range of Gray level is 0 to 9. The default value is 9.
   *
   *   Returns:
   *   none
   * */
  Future<void> setSpeedLevel(int level) async {
    return UrovoPrintPlatform.instance.setSpeedLevel(level);
  }

  /**
   * Set the page size. Unit is in pixel. 8 pixels is equivalent to 1 mm.
   *
   *   Parameters:
   *   width - Page width. -1 means largest possible width (width = 384).
   *   height - Page height. -1 means printer driver to manage the page height.
   *
   *   Returns:
   *   0 if success, -1 if failed.
   * */
  Future<int?> setupPage(int width, int height) {
    return UrovoPrintPlatform.instance.setupPage(width, height);
  }
}
