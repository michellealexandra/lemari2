part of 'pages.dart';

class DetailClothes extends StatefulWidget {
  static const String routeName = "/detailclothes";
  @override
  _DetailClothesState createState() => _DetailClothesState();
}

class _DetailClothesState extends State<DetailClothes> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Clothes A",
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.red,
                            width: size.width * 0.1,
                            height: size.height * 0.1,
                          ),
                          SizedBox(
                            height: size.width * 0.05,
                          ),
                          Container(
                            color: Colors.red,
                            width: size.width * 0.1,
                            height: size.height * 0.1,
                          ),
                          SizedBox(
                            height: size.width * 0.05,
                          ),
                          Container(
                            color: Colors.red,
                            width: size.width * 0.1,
                            height: size.height * 0.1,
                          ),
                          SizedBox(
                            height: size.width * 0.05,
                          ),
                          Container(
                            color: Colors.red,
                            width: size.width * 0.1,
                            height: size.height * 0.1,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: size.width * 0.7,
                            height: size.height * 0.6,
                            decoration: BoxDecoration(
                              //https://www.codegrepper.com/code-examples/dart/flutter+fill+an+image+in+a+container
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/images/dummy.jpg")),
                              //https://googleflutter.com/flutter-border-around-image/
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(18.0)),
                              // border: Border.all(
                              //   color: Colors.brown,
                              //   width: 10,
                              // ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "20 August 2021",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff564B46)),textAlign: TextAlign.left
                  ),
                  Text(
                    "Black Dress",
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff564B46)),textAlign: TextAlign.left
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff564B46)),textAlign: TextAlign.left
                  )
                ],
              )),
        ));
  }
}
