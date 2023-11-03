class Hospital {
  final String name;
  final String location;
  final double rating;
  final String imageUrl;
  final List<Clinic> clinics;
  final List<Notification> notifications;


  Hospital(
      {required this.name,
      required this.location,
      required this.rating,
      required this.imageUrl,
      required this.clinics,
      required this.notifications,});
}

class Clinic {
  final String name;
  final String location;
  final double rating;
  final int contact;
  final int fees;
  // final String doctorName;
  // final String specializing;

  final List<Appointment> appointments;

  Clinic(//this.doctorName, this.specializing,
      {required this.name,
      required this.location,
      required this.contact,
      required this.rating,
      required this.fees,
      required this.appointments});
}

class Appointment {
  final DateTime date;
  final String contact;

  Appointment({required this.date, required this.contact});
}
class Notification {
  final int id;
  final String title;
  final String supportedby;
  final String sponsoredby;
  final String implementation;
  final String description;
  final DateTime startdate;
  final DateTime enddate;
  final String address;
  final String doctorname;
  final String specializing;
  Notification(
      this.id,
      this.supportedby,
      this.sponsoredby,
      this.implementation,
      this.address,
      this.doctorname,
      this.specializing,
      this.startdate,
      this.enddate,
      {required this.title,
        required this.description});
}