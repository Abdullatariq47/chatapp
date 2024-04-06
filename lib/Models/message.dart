import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Message {
  final bool isUser;
  RxString message;
  final DateTime date;
  String? imagepath;

  Message(
      {required this.isUser,
      required this.date,
      this.imagepath = "",
      required this.message});
}
