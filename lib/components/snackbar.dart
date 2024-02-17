import 'package:flutter/material.dart';
import 'package:get/get.dart';

void errorSnackbar(String? msg) {
  Get.showSnackbar(
    GetSnackBar(
      message: msg ?? "ورودی ها نمی توانند خالی باشند",
      isDismissible: true,
      icon: Icon(
        Icons.error,
        color: Colors.red[600],
      ),
      mainButton: TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          "متوجه شدم",
          style: TextStyle(
            color: Colors.red[600],
          ),
        ),
      ),
      duration: const Duration(
        seconds: 3,
      ),
    ),
  );
}

void successSnackbar(BuildContext context, String msg) {
  Get.showSnackbar(GetSnackBar(
    message: msg,
    isDismissible: true,
    icon: Icon(
      Icons.done,
      color: Colors.greenAccent[200],
    ),
    mainButton: TextButton(
      onPressed: () {
        Get.back();
      },
      child: Text(
        "متوجه شدم",
        style: TextStyle(
          // ignore: use_build_context_synchronously
          color: Theme.of(context).primaryColorLight,
        ),
      ),
    ),
    duration: const Duration(
      seconds: 3,
    ),
  ));
}
