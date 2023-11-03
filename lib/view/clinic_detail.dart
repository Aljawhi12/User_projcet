import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/model_for_hospital_c_a.dart';
import 'book_appointment.dart';

class ClinicDetail extends StatelessWidget {
  const ClinicDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final clinic = Get.arguments as Clinic;

    return Scaffold(
      appBar: AppBar(title: Text(clinic.name)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           SizedBox(
              width: double.infinity,
              height: 200,
              child: CircleAvatar(          backgroundColor:Colors.white,
                  child:Image.asset('images/hospital.png'))),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              // Handle rating update event here
            },
          ),
          Column(
            children: [
              const Text("الدكتور زايد محمد الجوهي"),
              const Text(" إستشاري "),
              const Text(" جراحة عامة "),
              const Text(" متخصص في "),
              const Text("""معالجة تقرحات الفم واللثة والتصبغات الجلدية
                                      """),
              const Text(" ايام الدوام "),

              const Text(""" الاحد الاثنين الثلاثاء الاربعاء الخميس
                                      """),
              Text(clinic.location),
              const SizedBox(height: 10.0),
              // Text("تقييم${clinic.rating.toString()} "),
              const SizedBox(height: 10.0),
            ],
          ),

          // Text(" التواصل${clinic.contact.toString()}"),
          const SizedBox(height: 10.0),
          //  Text("${clinic.fees.toString()}رسوم التسجيل في  ${clinic.name}"),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: clinic.appointments.length,
          //     itemBuilder: (context, index) {
          //       final appointment = clinic.appointments[index];
          //       return ListTile(
          //         // title: Text(appointment.date.toString()),
          //         subtitle: Text(appointment.contact),
          //       );
          //     },
          //   ),
          // ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(children: [
              Expanded(
                flex: 30,
                child: ElevatedButton(
                  onPressed: () async {
                    final call =
                        Uri.parse('tel:${clinic.contact.toString()}');
                    if (await canLaunchUrl(call)) {
                      launchUrl(call);
                    } else {
                      throw 'Could not launch $call';
                    }
                  },
                  child: const Text('اتصال'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 50,
                child: ElevatedButton(
                    onPressed: () {
                     // Get.toNamed('/book_appointment');
                      Get.to(const AppointmentForm());
                    },
                    child: const Text("حجز موعد ")),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
