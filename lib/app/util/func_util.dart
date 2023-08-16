import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../config/constants.dart';

void logKey([key, content]) {
  String finalLog = '';
  dynamic tempContent = content ?? key;
  if (tempContent is Map) {
    // finalLog = jsonEncode(tempContent);
    finalLog = prettyJson(tempContent);
  } else if (tempContent is String) {
    finalLog = tempContent;
  } else {
    // finalLog = tempContent.toString();
  }

  if (content != null) {
    log('$key => $finalLog');
  } else {
    log(finalLog);
  }
}

String prettyJson(dynamic json) {
  var spaces = ' ' * 4;
  var encoder = JsonEncoder.withIndent(spaces);
  return encoder.convert(json);
}

void catchError({nameFunc, msg}) {
  logKey('$nameFunc error', msg);
  showSnackbar(pesan: msg, color: Colors.red);
}

String dateFormater(
  dynamic date, {
  String dateFormat = kDateFormatDateDetail,
}) {
  String res = "-";
  try {
    if (date is String) {
      res = DateFormat(dateFormat).format(DateTime.parse(date));
      logKey(date);
    }
    if (date is DateTime) {
      res = DateFormat(dateFormat).format(date);
    }
    return res;
  } catch (e) {
    // res = "-";
    return res;
  }
}

// void showToast({required msg}) {
//   Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.SNACKBAR,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.red,
//       textColor: Colors.white,
//       fontSize: 16.0);
// }

void showSnackbar({
  String? tittle,
  required String pesan,
  Color? color,
}) {
  Get.showSnackbar(
    GetSnackBar(
      title: tittle,
      message: pesan,
      isDismissible: true,
      snackPosition: SnackPosition.BOTTOM,
      animationDuration: kDefaultDuration,
      duration: const Duration(seconds: 2),
      forwardAnimationCurve: Curves.easeInOutCirc,
      reverseAnimationCurve: Curves.easeOutCirc,
      maxWidth: 425,
      borderRadius: 10,
      margin: const EdgeInsets.all(kDefaultPadding),
      backgroundColor: color ?? secondaryColor,
    ),
  );
}

Widget loading({double? size}) {
  return SpinKitSpinningLines(
    color: kBgWhite,
    size: size ?? 50,
  );
}

Widget borderTop() {
  return Align(
    alignment: Alignment.center,
    child: Container(
      height: 5,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: kBgWhite,
      ),
    ),
  );
}

dialogLoading() {
  Get.dialog(
    loading(),
    barrierDismissible: false,
  );
}
