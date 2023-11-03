// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // ignore: depend_on_referenced_packages
// import 'package:intl/intl.dart';
//
// import '../model/model_for_hospital_c_a.dart';
//
// class BookAppointment extends StatefulWidget {
//   final Clinic clinic;
//
//   const BookAppointment({Key? key, required this.clinic}) : super(key: key);
//
//   @override
//   // ignore: library_private_types_in_public_api
//   _BookAppointmentState createState() => _BookAppointmentState();
// }
//
// class _BookAppointmentState extends State<BookAppointment> {
//   DateTime? _date;
//   final _formKey = GlobalKey<FormState>();
//   final _contactController = TextEditingController();
//
//   @override
//   void dispose() {
//     _contactController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // final clinic = Get.arguments as Clinic;
//     return Scaffold(
//       appBar: AppBar(title: const Text('Book Appointment')),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             TextButton(
//               child: Text(_date == null
//                   ? 'Pick a date'
//                   : 'Selected date: ${DateFormat.yMd().format(_date!)}'),
//               onPressed: () async {
//                 final DateTime? date = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime.now(),
//                   lastDate: DateTime(DateTime.now().year + 1),
//                 );
//
//                 setState(() {
//                   _date = date;
//                 });
//               },
//             ),
//             TextFormField(
//               controller: _contactController,
//               validator: (value) {
//                 if (value!.isEmpty || value.length < 11) {
//                   return 'Please enter a valid contact number';
//                 }
//                 return null;
//               },
//               keyboardType: TextInputType.phone,
//               decoration:
//                   const InputDecoration(hintText: 'Enter your contact number'),
//             ),
//             ElevatedButton(
//               child: const Text('Save'),
//               onPressed: () {
//                 if (_formKey.currentState!.validate() && _date != null) {
//                   final appointment = Appointment(
//                       date: _date!, contact: _contactController.text);
//                   widget.clinic.appointments.add(appointment);
//                   Get.back();
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'booking.dart';

class AppointmentForm extends StatefulWidget {
  const AppointmentForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AppointmentFormState createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _reasonController;

  String? _selectedDay;
  String? _selectedGender;
  String? _selectedTime;
  DateTime? _selectedDate;

  @override
  void initState() {
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _reasonController =TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  void _selectDate() async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (selected != null) {
      setState(() {
        _selectedDate = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حجز موعد'),
      ),
      body: SingleChildScrollView (
        child:  Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'الاسم',
                ),
              ), TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'رقم الجوال',
                ),
              ),
              TextFormField(
                controller: _reasonController,
                decoration: const InputDecoration(
                  labelText: 'غرض الزيارة',
                ),
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedDay,
                onChanged: (value) {
                  setState(() {
                    _selectedDay = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'ايام الدوام',
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'الاحد',
                    child: Text('الاحد'),
                  ),
                  DropdownMenuItem(
                    value: 'الاثنين',
                    child: Text('الاثنين'),
                  ),
                  DropdownMenuItem(
                    value: 'الثلاثاء',
                    child: Text('الثلاثاء'),
                  ),
                  DropdownMenuItem(
                    value: 'الاربعاء',
                    child: Text('الاربعاء'),
                  ),
                  DropdownMenuItem(
                    value: 'الخميس',
                    child: Text('الخميس'),
                  ),

                  // Add more options as needed
                ],
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedTime,
                onChanged: (value) {
                  setState(() {
                    _selectedTime = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'فترة الحجز',
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'مساء',
                    child: Text('مساء'),
                  ),
                  DropdownMenuItem(
                    value: 'الصباح',
                    child: Text('الصباح'),
                  ),


                  // Add more options as needed
                ],
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'تحديد النوع الجنس',
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'ذكر',
                    child: Text('ذكر'),
                  ),
                  DropdownMenuItem(
                    value: 'انثى',
                    child: Text('انثى'),
                  ),


                  // Add more options as needed
                ],
              ),
              const SizedBox(height: 16.0),
              // ElevatedButton(
              //   onPressed: _selectDate,
              //   child: Text(_selectedDate == null
              //       ? 'Select date and time'
              //       : 'Date and time selected: ${_selectedDate.toString()}'),
              // ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Save the appointment to the database or server
                  // ...

                  // Show a confirmation message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('تم الحجز بنجاح'),
                    ),
                  );
                  Get.to(const Booking());
                },
                child: const Center(child: Text('حجز الموعد')),
              ),
            ],
          )  ),
        ),
      ),
    );
  }
}