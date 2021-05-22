part of 'pages.dart';

class CardClothesLemari extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        //tombol back hilang pushReplacementNamed, klo push named ada back button
        Navigator.pushNamed(context, DetailClothes.routeName);
      },
      child: Card(
        elevation: 5,
        color: Color(0xffEDD3B9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.width * 0.1,
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.42,
              height: MediaQuery.of(context).size.height * 0.28,
              decoration: BoxDecoration(
                  color: Color(0xffA77665),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(14.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage("assets/images/dummy.jpg"),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    "Brown Cookies",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffF0E8E1)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.42,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                  color: Color(0xffF0E8E1),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(14.0))),
              child: Row(
                  //logo"nya
                  children: [
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/icons/Mesin.png"))),
                      width: size.width * 0.08,
                      height: size.height * 0.08,
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/icons/Dress.png"))),
                      width: size.width * 0.08,
                      height: size.height * 0.08,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
