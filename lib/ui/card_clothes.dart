part of 'pages.dart';

class CardClothes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          top: MediaQuery.of(context).size.width * 0.05,
          bottom: MediaQuery.of(context).size.width * 0.08,
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                  color: Color(0xffA77665),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(14.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/dummy.jpg"),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    "Brown Cookies",
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffF0E8E1)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                  color: Color(0xffF0E8E1),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(14.0))),
              child: Column(
                  //logo"nya
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
