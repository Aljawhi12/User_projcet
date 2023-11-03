import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'home.dart';
class ProfilePage extends StatelessWidget {

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('الملف الشخصي')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: CircleAvatar(child: Icon(Icons.person))),
                // Obx(() => CircleAvatar(
                //       radius: 80,
                //       backgroundImage: controller.image.value != null
                //           ? Image.file(controller.image.value! as File,
                //               fit: BoxFit.cover)
                //           : const AssetImage('assets/images/default_avatar.png'),
                //       child: IconButton(
                //         icon: const Icon(Icons.camera_alt),
                //         onPressed: controller.pickImage,
                //         tooltip: 'Change profile picture',
                //       ),
                //     )),
                const SizedBox(height: 16),
                TextFormField(
                  // controller: controller.nameController,
                  decoration: const InputDecoration(
                    labelText: 'الاسم',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Save the appointment to the database or server
                    // ...

                    // Show a confirmation message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم الحفظ بنجاح'),
                      ),
                    );
                    Get.to(const MyHomePage());
                  },
                  child: const Center(child: Text('حفظ التغيرات')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
