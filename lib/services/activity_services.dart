part of 'services.dart';

class ActivityServices {
  static String dateNow() {
    var now = new DateTime.now();
    //format updatedAt dan createdAt
    var formatter = new DateFormat('yyyy-MM-dd:mm:ss');
    String hasil = formatter.format(now);
    return hasil;
  }

  static void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Color(0xffFFEFDF),
        textColor: Color(0xff564B46),
        fontSize: 14);
  }

  static Container loadings() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.black26,
      child: SpinKitFadingCircle(
        size: 50, color: Color(0xff564B46),
      ),
    );
  }
}
