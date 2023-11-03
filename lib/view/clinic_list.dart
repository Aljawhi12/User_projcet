import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/model_for_hospital_c_a.dart';

class ClinicList extends StatelessWidget {
  const ClinicList({super.key});

  @override
  Widget build(BuildContext context) {
    final hospital = Get.arguments as Hospital;

    return Scaffold(
      appBar: AppBar(title: Text('عيادات ${hospital.name} ')),
      body: ListView.builder(
        itemCount: hospital.clinics.length,
        itemBuilder: (_, index) {
          return Directionality(
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
                    title: Text(hospital.clinics[index].name),
                    subtitle: Text(hospital.clinics[index].location),
                    trailing: Text(hospital.clinics[index].rating.toString()),
                    onTap: () {
                      final clinic = hospital.clinics[index];
                      Get.toNamed('/clinic_detail', arguments: clinic);
                      //  Get.toNamed('/book_appointment', arguments: clinic);
                    },
                  )));
        },
      ),
    );
  }
}
