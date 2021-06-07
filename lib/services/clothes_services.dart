part of 'services.dart';

class ClothesServices {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static CollectionReference productCollection =
      FirebaseFirestore.instance.collection("clothes");
  static DocumentReference productDocument;

  static Reference ref;
  static UploadTask uploadTask;
  static String imgUrl;

  static Future<bool> addClothes(
      Clothes clothes, Closets closets, PickedFile imgFile) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    productDocument = await productCollection.add({
      'clothesId': clothes.clothesId,
      'clothesName': clothes.clothesName,
      'clothesDesc': clothes.clothesDesc,
      'clothesImage': clothes.clothesImage,
      'clothesCloset': closets.closetId,
      'clothesAddBy': auth.currentUser.uid,
      'clothesAge': clothes.clothesAge,
      'clothesTag': clothes.clothesTag,
      'clothesStatus': clothes.clothesStatus,
      'clothesLaundry': clothes.clothesLaundry,
      'createdAt': dateNow,
      'updatedAt': dateNow,
    });

    if (productDocument != null) {
      ref = FirebaseStorage.instance
          .ref()
          .child("imagesClothes")
          .child(productDocument.id + ".jpg");
      uploadTask = ref.putFile(File(imgFile.path));

      await uploadTask.whenComplete(() => ref.getDownloadURL().then(
            (value) => imgUrl = value,
          ));

      productCollection.doc(productDocument.id).update({
        'clothesId': productDocument.id,
        'clothesImage': imgUrl,
      });

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteClothes(String id) async {
    bool hsl = true;
    await Firebase.initializeApp();
    await productCollection.doc(id).delete().then((value) {
      hsl = true;
    }).catchError((onError) {
      hsl = false;
    });

    return hsl;
  }

  static Future<String> editClothes(
      String id,
      String clothesName,
      String clothesDesc,
      String clothesstatus,
      String clothesAge,
      String clothesTag,
      String clothesLaundry) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    String clothesName = "";
    String clothesDesc = "";
    String clothesAge = "";
    String clothesTag = "";
    String clothesstatus = "";
    String clothesLaundry = "";
    String msg = "";
    Clothes clothes;

    await productCollection.doc(clothes.clothesId).update({
      'clothesName': clothesName,
      'clothesDesc': clothesDesc,
      'clothesAge': clothesAge,
      'clothesTag': clothesTag,
      'clothesstatus': clothesstatus,
      'clothesLaundry': clothesLaundry,
      'updatedAt': dateNow,
    }).then((value) {
      msg = "Success";
    }).catchError((onError) {
      msg = onError;
    });

    return msg;
  }
}
