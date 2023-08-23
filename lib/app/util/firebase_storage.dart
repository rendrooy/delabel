import 'dart:io';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:image_picker/image_picker.dart';

Future<void> uploadImageToFirebase(File imageFile) async {
  try {
    String token = await FirebaseAppCheck.instance.getToken() ?? "";
    final storage = firebase_storage.FirebaseStorage.instance;
    final reference = storage.ref().child('images/${DateTime.now()}.png');
    await reference.putFile(
      imageFile,
      firebase_storage.SettableMetadata(
        customMetadata: {'appCheckToken': token},
      ),
    );
    print('Image uploaded.');
  } catch (e) {
    print('Error uploading image: $e');
  }
}


// Future<String?> uploadImageToFirebase(File imageFile, String path) async {
//   try {
//     // var auth = FirebaseAuth.instance.currentUser?.getIdToken();
//     // FirebaseApp app = await Firebase.initializeApp();
//     final storage = firebase_storage.FirebaseStorage.instance;

//     final reference = storage.ref().child('$path/${DateTime.now()}.png');
//     final uploadTask = reference.putFile(imageFile);

//     final snapshot = await uploadTask.whenComplete(() => null);
//     final downloadURL = await snapshot.ref.getDownloadURL();
//     log('Upload success: $downloadURL');
//     return downloadURL;
//   } catch (e) {
//     print('Error uploading image: $e');
//     return null;
//   }
// }

// Future<File?> pickImageFromGallery() async {
//   final picker = ImagePicker();
//   final pickedFile = await picker.getImage(source: ImageSource.gallery);
//   if (pickedFile != null) {
//     return File(pickedFile.path);
//   }
//   return null;
// }
