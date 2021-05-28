part of 'pages.dart';

class CardClothesLemari extends StatefulWidget {
  final Clothes clothes;
  DocumentSnapshot doc;

  CardClothesLemari({this.clothes, this.doc});
  @override
  _CardClothesLemariState createState() => _CardClothesLemariState();
}

class _CardClothesLemariState extends State<CardClothesLemari> {
  @override
  Widget build(BuildContext context) {
    DocumentSnapshot doc;
    Clothes baju = widget.clothes;
    final Size size = MediaQuery.of(context).size;
    if (baju == null) {
      return Container(
          // child: Text("Null"),
          );
    } else {
      return Padding(
          padding:
              EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
          child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, DetailClothes.routeName,
                    arguments: baju);
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Color(0xffA77665),
                  ),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.04),
                      // child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       isFavorite
                      //           ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                      //           : Icon(Icons.favorite_border,
                      //               color: Color(0xFFEF7532))
                      //     ]),
                    ),
                    Hero(
                      tag: baju.clothesId,
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage("assets/images/dummy.jpg"),
                      ),
                    ),
                    SizedBox(height: 7.0),
                    Text(
                      baju.clothesName,
                      // doc.data()['clothesName'],
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: GoogleFonts.openSans().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffF0E8E1)),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child:
                          Container(color: Color(0xFFEBEBEB), height: 2.9657),
                    ),
                    Container(
                      color: Color(0xffF0E8E1),
                      child: Row(
                          //logo"nya
                          children: [
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(14.0)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/Mesin.png"))),
                              width: size.width * 0.07,
                              height: size.height * 0.07,
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/Dress.png"))),
                              width: size.width * 0.07,
                              height: size.height * 0.07,
                            ),
                          ]),
                    )
                  ]))));
    }
  }
}
