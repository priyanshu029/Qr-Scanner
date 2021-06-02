import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_scanner/service/get_attendance_data.dart';

class MarkAttendence extends StatefulWidget {
  final String userEmail;
  MarkAttendence(this.userEmail);
  @override
  _MarkAttendenceState createState() => _MarkAttendenceState();
}

class _MarkAttendenceState extends State<MarkAttendence> {
  var check = '8248731840';

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      // print(qrCode);
      if (qrCode == check) {
        print('present today');
        await AttendanceData().addData(true, widget.userEmail);
        Navigator.canPop(context);
        setState(() {});
      } else {
        print('Not today');
        await AttendanceData().addData(false, widget.userEmail);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Center(
          child: ElevatedButton(
            child: Text(
              'Scan Qr Code',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () async {
              print('Scan Qr Code');
              await scanQRCode();
            },
          ),
        ),
      ),
    );
  }
}
