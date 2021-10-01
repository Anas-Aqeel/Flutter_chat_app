import 'package:chat_app_ui/home/widgets/editProfileBox.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future<void> uploadPic(_imageName, _image) async {
  firebase_storage.FirebaseStorage.instance;
  firebase_storage.Reference ref =
      firebase_storage.FirebaseStorage.instance.ref('$_imageName');
  await ref.putFile(_image);
  link = await ref.getDownloadURL();
  imageName = '';
  print(link);
}
