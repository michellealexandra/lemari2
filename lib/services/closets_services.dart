part of 'services.dart';

class ClosetsServices {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static CollectionReference productCollection =
      FirebaseFirestore.instance.collection("closets");
  static DocumentReference productDocument;

  static Reference ref;
  static UploadTask uploadTask;
  static String imgUrl;

  static Future<bool> addClosets(Closets closets, PickedFile imgFile) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    productDocument = await productCollection.add({
      'closetId': closets.closetId,
      'closetName': closets.closetName,
      'closetDesc': closets.closetDesc,
      'closetImage': closets.closetImage,
      'closetAddby': auth.currentUser.uid,
      'createdAt': dateNow,
      'updatedAt': dateNow,
    });

    if (productDocument != null) {
      ref = FirebaseStorage.instance
          .ref()
          .child("imagesCloset")
          .child(productDocument.id + ".jpg");
      uploadTask = ref.putFile(File(imgFile.path));

      await uploadTask.whenComplete(() => ref.getDownloadURL().then(
            (value) => imgUrl = value,
          ));

      productCollection.doc(productDocument.id).update({
        'closetId': productDocument.id,
        'closetImage': imgUrl,
      });

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteClosets(String id) async {
    bool hsl = true;
    await Firebase.initializeApp();
    await productCollection.doc(id).delete().then((value) {
      hsl = true;
    }).catchError((onError) {
      hsl = false;
    });

    return hsl;
  }

// static Future<bool> deleteImages(String id) async {
//     bool hsl = true;
//     await Firebase.initializeApp();
//     await FirebaseStorage.instance.ref(id).delete().then((value) {
//       hsl = true;
//     }).catchError((onError) {
//       hsl = false;
//     });

//     return hsl;
//   }

}
