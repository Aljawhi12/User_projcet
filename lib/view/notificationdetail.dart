import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'book_appointment.dart';

class NotificationDetail extends StatelessWidget {
  const NotificationDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(" تفاصيل الاشعار ")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: ClipOval(
              child: Image.asset(
                'images/notification.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
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

          const Column(
            children: [
              Text("برعاية مكتب وزارة الصحة والسكان باودي والصحرى "),
              Text(" وبدعم من صندوق الطبي الخيري "),
              Text("  وتنفيذ مستشفى بن زيع الحديث "),
              Text(" إقامة المخيم الطبي المجاني لعمليات المسالك البولية  "),
              Text("""  تشمل الاتي """),
              Text("""    منظارحصوات الفتح, منظارحصوات حالب  """),
              Text("""  2022/5/16  المعاينة الثلاثاء تاريخ """),
              Text(' الساعة 8 صباحا الى 1 ظهرا'),
              Text(' المكان مستشفى بن زيلع الحديث'),
              SizedBox(height: 10.0),
              Text('تحت إشراف /د.عبدالله نقحان'),
              Text(' إستشاري جراحة الكلى و المسالك البولية والعقم '),
              Text('ملاحظة المعاينة و العمليات فقط مجاني '),
              SizedBox(height: 10.0),
            ],
          ),

          // Text(" التواصل${clinic.contact.toString()}"),
          const SizedBox(height: 10.0),
          //  Text("${clinic.fees.toString()}رسوم التسجيل في  ${clinic.name}"),

          Container(
            margin: const EdgeInsets.all(10),
            child: Row(children: [
              Expanded(
                flex: 30,
                child: ElevatedButton(
                  onPressed: () async {
                    final call = Uri.parse('tel:${545454}');
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
