import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp_of/view/profile.dart';

import '../main.dart';
import 'booking.dart';
import 'notification.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String searchValue = '';
  final List<String> _suggestions = [
    'مستشفى حضرموت',
    'مستسفى سيؤن',
  ];

  Future<List<String>> _fetchSuggestions(String searchValue) async {
    await Future.delayed(const Duration(milliseconds: 750));

    return _suggestions.where((element) {
      return element.toLowerCase().contains(searchValue.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'تعاهدنا',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          appBar: EasySearchBar(
              title: Text("أمل".tr),
              onSearch: (value) => setState(() => searchValue = value),
              actions: [
                IconButton(
                    icon: const Icon(Icons.notifications_outlined),
                    onPressed: () {
                      Get.toNamed('/notification');
                    })
              ],
              asyncSuggestions: (value) async =>
                  await _fetchSuggestions(value)),
          drawer: Drawer(
              child: ListView(padding: EdgeInsets.zero, children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Ali'),
              accountEmail:null,
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('Ali'),
              ),
            ),
            // const DrawerHeader(
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            //   child: Text('Drawer Header'),
            // ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text(
                        'الملف الشخصي',
                      ),
                      onTap: () => Get.to(const ProfilePage())),
                  ListTile(
                      leading: const Icon(Icons.book_online),
                      title: const Text('إدارة الحجورات '),
                      onTap: () => Get.to(const Booking())),
                  ListTile(
                      leading: const Icon(Icons.exit_to_app),
                      title: const Text('الخروج'),
                      onTap: () => Navigator.pop(context))
                ],
              ),
            ),
          ])),
          body: ListView.builder(
            itemCount: hospitals.length,
            itemBuilder: (_, index) {
              final hospital = hospitals[index];
              final totalClinics =
                  hospital.clinics.fold<int>(0, (count, clinic) => count + 1);
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
                    //selected: true,

                    leading: Image.asset('images/hospital.png'),
                    // Text(
                    //   hospitals[index].imageUrl,
                    // ),
                    title: Text(hospitals[index].name,
                        style: const TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(hospitals[index].location),
                        Text('$totalClinics العيادات '),
                      ],
                    ),
                    trailing: Text(hospitals[index].rating.toString()),
                    onTap: () {
                      final hospital = hospitals[index];
                      Get.toNamed('/clinic_list', arguments: hospital);
                    },
                  ),
                ),
              );
            },
          ),
          //Center(child: Text('Value: $searchValue'))
        ));
  }
}
