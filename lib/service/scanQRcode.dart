// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// class ScanQRcode{
//   Future<void> scanQRCode() async {
//     try {
//       final qrCode = await FlutterBarcodeScanner.scanBarcode(
//         '#ff6666',
//         'Cancel',
//         true,
//         ScanMode.QR
//       );

//       // if (!mounted) return;

//       setState(() {
//         this.qrCode = qrCode;
//       });
//       print(qrCode);
//       if(qrCode==check){
//         print('present today');
//       }else{
//         print('Not today');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }