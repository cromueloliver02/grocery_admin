import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../../data/models/models.dart';
import '../presentation/widgets/widgets.dart';

void showErrorDialog(
  BuildContext ctx, {
  required GCRError error,
}) {
  showDialog(
    context: ctx,
    barrierDismissible: false,
    builder: (ctx) => GCRErrorDialog(error: error),
  );
}

void showMessageToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 10,
    backgroundColor: Colors.grey,
    textColor: Colors.white,
    fontSize: 16.0,
    webBgColor: 'grey',
    webPosition: 'center',
  );
}

Future<Uint8List> urlToBytes(String imageUrl) async {
  http.Response response = await http.get(Uri.parse(imageUrl));

  return response.bodyBytes;
}

String formatDateTime(DateTime dateTime) {
  return DateFormat('MM/dd/yyyy - hh:mm a').format(dateTime);
}
