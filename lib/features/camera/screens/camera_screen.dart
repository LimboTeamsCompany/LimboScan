import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limboscan/features/urls/cubit/urls_cubit.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool isLoading = true;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  void onLoadCamera(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen(onScanQR);
  }

  void onScanQR(Barcode scanData) {
    context
        .read<UrlsCubit>()
        .goToUrlProfile(url: scanData.code ?? '', context: context);

    controller?.stopCamera();
    controller?.dispose();
    controller = null;
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.stopCamera();
    controller?.dispose();
    controller = null;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!mounted ||
        (controller != null && controller?.hasPermissions == false)) {
      return Scaffold(
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: const Center(child: Text('No permisos')),
        ),
      );
    }

    return Scaffold(
      body: SizedBox(
        height: 100.h,
        child: QRView(
          key: qrKey,
          onQRViewCreated: onLoadCamera,
        ),
      ),
    );
  }
}
