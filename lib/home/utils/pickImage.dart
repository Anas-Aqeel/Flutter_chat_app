import 'dart:io';
import 'package:chat_app_ui/home/widgets/editProfileBox.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';


Future<void> pickImage() async {
  try {
    File _image;
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    _image = File(image!.path);
    imageName = path.basename(_image.path);
    profileImage = _image;

  } catch (e) {
    print('$e');
  }
}
