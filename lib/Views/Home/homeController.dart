import 'package:chatapp/Firebase/fireStoreController.dart';

class HomeController {
  late FireStoreController fireStoreController;

  Future<void> geminiInit() async {
    fireStoreController = FireStoreController();
    await fireStoreController.getApiKey();
  }
}
