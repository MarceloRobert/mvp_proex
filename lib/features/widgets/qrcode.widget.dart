import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qrcodemvp extends StatelessWidget {
  const Qrcodemvp({Key? key}) : super(key: key);

  final String qrData = "Os dados do qrcode vão aqui";
  // final qrKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('qrCode'),
      ),
      body: Center(
        child: QrImage(
          // key: qrKey,
          data: qrData,
          size: 250,
          backgroundColor: Colors.white,
          version: QrVersions.auto,
        ),
      ),
    );
  }
}
