import 'package:flutter/material.dart';
import 'package:limboscan/features/dashboard/widget/camera_modals/camera_modal_ask_permissions.dart';
import 'package:limboscan/features/dashboard/widget/camera_modals/camera_modal_denied_permissions.dart';

void openModalToAskPermissions(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        content: CameraModalAskPermissions()),
  );
}

void openModalDeniedPermissions(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        content: CameraModalDeniedPermissions()),
  );
}
