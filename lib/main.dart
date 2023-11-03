import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp_of/view/clinic_detail.dart';
import 'package:userapp_of/view/clinic_list.dart';
import 'package:userapp_of/view/home.dart';
import 'package:userapp_of/view/notification.dart';
import 'package:userapp_of/view/notificationdetail.dart';

import 'model/model_for_hospital_c_a.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  get location => null;

  get name => null;

  get rating => null;

  get fees => null;

  get appointments => null;

  get contact => null;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter GetX Hospitals',
      initialRoute: '/',
      locale: Get.deviceLocale,
      getPages: [
        GetPage(name: '/', page: () => const MyHomePage()),
        GetPage(name: '/clinic_list', page: () => const ClinicList()),
        GetPage(name: '/clinic_detail', page: () => const ClinicDetail()),
        GetPage(name: '/notification', page: () => const Notifications()),
        GetPage(name: '/notification-detail', page: () => const NotificationDetail()),
        // GetPage(
        //     name: '/book_appointment',
        //     page: () => BookAppointment(
        //           clinic: Clinic(
        //               name: 'name',
        //               location: location,
        //               contact: contact,
        //               rating: rating,
        //               fees: fees,
        //               appointments: appointments),
        //         )),
      ],
    );
  }
}

List<Hospital> hospitals = [
  Hospital(
    name: 'مستشفى حضرموت العام',
    location: 'المكلا',
    rating: 3.5,
    imageUrl: 'a.png',
    clinics: [
      Clinic(
          name: 'عيادة العظام',
          location: 'طابق الاول',
          contact: 717512447,
          rating: 3.5,
          fees: 100, appointments: [],
          ),
      Clinic(
          name: 'عيادة الباطنية',
          location: 'طابق ثاني',
          contact: 714447123,
          rating: 4.5,
          fees: 150,
          appointments: []),
    ],
    notifications: [],
  ),
  Hospital(
    name: 'مستشفى سيؤن العام',
    location: 'سيؤن',
    rating: 4.0,
    imageUrl: 'a.png',
    clinics: [
      Clinic(
          name: 'عيادة الباطنية',
          location: 'طابق الاول',
          contact: 345678,
          rating: 4.5,
          fees: 120,
          appointments: []),
      Clinic(
          name: 'عيادة اذن وحنجورة',
          location: 'طابق ثالث ',
          contact: 901234,
          rating: 5.0,
          fees: 200,
          appointments: []),
    ],
    notifications: [],
  ),
];
