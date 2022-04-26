import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:xmeal/users/screens/order_details_screen.dart';
import 'package:xmeal/users/screens/orders_screen.dart';
import 'package:xmeal/users/styles/constants.dart';

class Qr_Scanner extends StatefulWidget {
  const Qr_Scanner({Key? key}) : super(key: key);
  static String id = 'QrScanner';

  @override
  State<Qr_Scanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<Qr_Scanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              overlay: QrScannerOverlayShape(
                  borderWidth: 10,
                  borderRadius: 10,
                  borderColor: appColour,
                  borderLength: 20,
                  cutOutSize: MediaQuery.of(context).size.width * 0.8),
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Column(
                      children: [
                        const Text(
                          'Qr Code scanned successfully',
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '  Data: ${result!.code}',
                          style: const TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(appColour)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const OrderDetails()));
                            },
                            child: const Text('Confirm Order',
                                style: TextStyle(color: Colors.white)))
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Column(
                        children: const [
                          Text(
                            'scan the Qr code of your table',
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'we do this inorder to know your location',
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }
}
