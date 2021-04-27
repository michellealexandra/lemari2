part of 'dashboard.dart';

class WeatherDash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
              Row(
                children: [
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.03,
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1),
                      elevation: 3,
                      color: Color(0xffD6AA8E),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.01,
                            bottom: MediaQuery.of(context).size.height * 0.01),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.055,
                            ),
                            FaIcon(
                              FontAwesomeIcons.cloud,
                              color: Color(0xff5D4736),
                              size: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text(
                              "15:00",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: GoogleFonts.openSans().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff5D4736)),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                            ),
                            Text(
                              "Saturday ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: GoogleFonts.openSans().fontFamily,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff5D4736)),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.height * 0.02,
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
