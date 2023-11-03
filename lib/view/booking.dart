import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notificationdetail.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الحجوزات")),
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
                      "غرض الزيارة الام اثناء البول",
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold)),
                  subtitle: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("عيادة المسالك البولية  مستشفى حضرموت "),
                      Text("يوم الثلاثاء مساء"),
                    ],
                  ),
                  onTap: () {
                    //final clinic = hospital.clinics[index];

                    //  Get.toNamed('/book_appointment', arguments: clinic);
                  },
                )))
      ]),
    );
  }
}
