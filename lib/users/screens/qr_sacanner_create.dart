import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);
  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('QR CODE GENERATOR'),
      ),
      body: Center(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          QrImage(
            data: controller.text,
            version: 1,
            size: 200,
            gapless: true,
            backgroundColor: Colors.white,
          ),
          const SizedBox(
            height: 40,
          ),
          TextField(
            controller: controller,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            decoration: InputDecoration(
                hintText: 'Enter Data',
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    )),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.done),
                  color: Theme.of(context).colorScheme.secondary,
                  iconSize: 30,
                )),
          ),
          MaterialButton(
              height: 10,
              child: const Text(
                'Scan Code',
                style: TextStyle(color: Colors.red),
              ),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QrScanner()));
              })
        ]),
      )),
    );
  }
}
