part of 'dashboard.dart';

class WeatherDash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Card(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  right: MediaQuery.of(context).size.width * 0.1),
              elevation: 3,
              color: Color(0xffEDD3B9),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.038,
                    bottom: MediaQuery.of(context).size.height * 0.038),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.05,
                    ),
                    //suhu/degree
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "33°",
                          style: TextStyle(
                              fontSize: 45,
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff5D4736)),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.05,
                    ),
                    //location and status
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.sun,
                              color: Color(0xff5D4736),
                              size: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Text(
                              "Sunny day",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: GoogleFonts.openSans().fontFamily,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff5D4736)),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          "Lidah Kulon, Surabaya",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: GoogleFonts.openSans().fontFamily,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff5D4736),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
