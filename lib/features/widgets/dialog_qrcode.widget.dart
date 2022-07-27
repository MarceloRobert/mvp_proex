import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

Future qrDialog(BuildContext context, int pointId) async {
  return showDialog(
    context: context,
    builder: (context) {
      return
          // title: const Text("QrCode"),
          // children: [
          QrImage(
        data: pointId.toString(),
        backgroundColor: Colors.white,
        size: 5,
        gapless: true,
      );
      //   ],
      // );
    },
  );
}
