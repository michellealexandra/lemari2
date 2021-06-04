part of 'services.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  static DocumentReference userDoc;

  static Reference ref;
  static String imgUrl;
  static UploadTask uploadTask;

  static Future<String> signUp(Users users) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    String msg = "";
    String token = "";
    String uid = "";

    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: users.email, password: users.password);

    uid = userCredential.user.uid;
    // token = await userCredential.user.getIdToken();
    token = await FirebaseMessaging.instance.getToken();

    await userCollection.doc(uid).set({
      'uid': uid,
      'name': users.name,
      'email': users.email,
      'password': users.password,
      'pic': users.pic,
      'token': token,
      'createdAt': dateNow,
      'updatedAt': dateNow,
    }).then((value) {
      msg = "Success";
    }).catchError((onError) {
      msg = onError;
    });

    auth.signOut();

    return msg;
  }

  static Future<String> signIn(String email, String password) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    String msg = "";
    String uid = "";
    String token = "";

    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);

    uid = userCredential.user.uid;
    token = await FirebaseMessaging.instance.getToken();

    await userCollection.doc(uid).update({
      'isOn': 1,
      'token': token,
      'updatedAt': dateNow,
    }).then((value) {
      msg = "Success";
    }).catchError((onError) {
      msg = onError;
    });

    return msg;
  }

  static Future<bool> signOut() async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    String uid = auth.currentUser.uid;

    await auth.signOut().whenComplete(() {
      userCollection.doc(uid).update({
        'isOn': '0',
        'token': '-',
        'updatedAt': dateNow,
      });
    });

    return true;
  }

  static Future<bool> editProfilePic(PickedFile imgFile) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();

    String uid = auth.currentUser.uid;

    ref = FirebaseStorage.instance.ref().child("profileImage").child(uid+"jpg");
    uploadTask = ref.putFile(File(imgFile.path));

    await uploadTask.whenComplete(() =>
      ref.getDownloadURL().then((value) => imgUrl = value)
    );

    await userCollection.doc(uid).update({
      'pic' : imgUrl,
      'updatedAt' : dateNow,
    });

    return true;
  }

  static Future<bool> editProfile(Users users) async {
    await Firebase.initializeApp();
    String dateNow = ActivityServices.dateNow();
    // String uid = auth.currentUser.uid;

    await userCollection.doc(auth.currentUser.uid).update({
      'name': users.name,
      'updatedAt': dateNow
    });
    
    return true;
  }
}