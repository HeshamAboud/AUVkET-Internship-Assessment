import 'dart:io';
bool isMobile() {
  if (Platform.isIOS || Platform.isAndroid) {
    return true; // Running on iOS or Android (mobile)
  } else {
    return false; // Running on another platform (web, desktop, etc.)
  }
}