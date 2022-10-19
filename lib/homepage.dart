import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:linkify/linkify.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var getResult = 'QR Code Result';
  String inkwell = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: Center(
          child: Text('Quick QR Scan',
              style: TextStyle(fontFamily: 'Beabus', fontSize: 30)),
        ),
        actions: [IconButton(onPressed: aboutDialog, icon: Icon(Icons.info))],
      ),
      body: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                  //color: Colors.amber,
                  height: 350,
                  width: 300,
                  child: Lottie.asset('images/assets/animation/animation.json')
                  // height: 450,
                  // width: 300,
                  // decoration: BoxDecoration(
                  //   //color: Colors.deepPurple,
                  //   image: DecorationImage(
                  //       image: AssetImage('images/qrcodescane.png'),
                  //       fit: BoxFit.contain),
                  // ),
                  ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: 300,
                //color: Colors.black,
                child: Column(
                  children: [
                    Center(
                      child: Linkify(
                        text: getResult,
                        // style: TextStyle(
                        //     decoration: TextDecoration.underline,
                        //     color: Colors.blue),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Get Link',
                      style: TextStyle(fontFamily: 'Beabus', fontSize: 30),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 5,
              ),
              //adding elevated button
              ElevatedButton.icon(
                onPressed: () => scanQRCode(),
                icon: Icon(
                  Icons.qr_code_scanner,
                  size: 30,
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                label: Text('SCAN',
                    style: TextStyle(fontFamily: 'Beabus', fontSize: 28)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
      });
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }

  aboutDialog() async {
    showAboutDialog(
        context: context,
        applicationName: 'Quick QR Scan',
        applicationIcon: Image.asset(
          'images/appstore.png',
          height: 50,
          width: 50,
        ),
        applicationVersion: '1.0.0',
        children: [
          Text('Developed by : Akhil\nDate : 9-29-2022'),
        ]);
  }
}
