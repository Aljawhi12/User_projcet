import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notificationdetail.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الاشعارات")),
      body: Column(children: [
        Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
                //height: 10,
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    //<-- SEE HERE
                    side: const BorderSide(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  title: const Text(
                      "إقامة المخيم الطبي المجاني لعمليات المسالك البولي",
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold)),
                  subtitle: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("تنفيذ مستشفى بن زيلع"),
                      Text("تحت إشراف د.عبدالله نقحان"),
                    ],
                  ),
                  onTap: () {
                    //final clinic = hospital.clinics[index];
                    Get.to(const NotificationDetail());
                    //  Get.toNamed('/book_appointment', arguments: clinic);
                  },
                )))
      ]),
    );
  }
}
