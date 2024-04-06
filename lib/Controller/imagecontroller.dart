import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';

import '../Models/message.dart';

class ImageController extends GetxController {
  RxString imagePath = ''.obs;
  RxList messages = [].obs;

  Future getImageCameera() async {
    final ImagePicker _imagePicker = ImagePicker();
    final image = await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }

  Future getImageGalary() async {
    final ImagePicker _imagePicker = ImagePicker();
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }
}
