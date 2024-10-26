import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:zetexa_practical/qr_scanner/qr_scanner_page.dart';

class QrGeneratorPage extends StatefulWidget {
  const QrGeneratorPage({super.key});

  @override
  State<QrGeneratorPage> createState() => _QrGeneratorPageState();
}

class _QrGeneratorPageState extends State<QrGeneratorPage> {
  var qrCtlr = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Qr generator'),
          actions: [
            IconButton(
              onPressed: () {

                // page navigation for the QR scanner page
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => QrScannerPage()));
              },
              icon: Icon(Icons.qr_code_scanner_rounded),
            ),
          ],
        ),
        body: Padding(
          padding:EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: qrCtlr,
                decoration: InputDecoration(
                  hintText: "Enter Content",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some content';
                  }
                },
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  ///form validation for content should not be empty
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (formKey.currentState!.validate()) {
                    showQrgeneratedDialog();
                  }
                },
                child: Text('Generate QR'),
              )
            ],
          ),
        ),
      ),
    );
  }

  showQrgeneratedDialog() {

    // genrated QR screen .
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 300
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImageView(
                  data: qrCtlr.text,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
