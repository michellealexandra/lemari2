part of 'pages.dart';

class Lemari extends StatefulWidget {
  static const String routeName = "/lemari";

  @override
  _LemariState createState() => _LemariState();
}

class _LemariState extends State<Lemari> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;


    return Scaffold(
      appBar: AppBar(
        title: Text("Lemari",
            style: TextStyle(
                color: Color(0xff564B46),
                fontFamily: GoogleFonts.openSans().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 24)),
        backgroundColor: Color(0xffFFFFFF).withOpacity(0.5),
        elevation: 0.0,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          ),
        ),
      ),
      
    );
  }
}
