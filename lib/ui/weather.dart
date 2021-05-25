part of 'pages.dart';

class WeatherWidget extends StatelessWidget {
  final String location;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String weather;
  final int humidity;
  final double windSpeed;

  const WeatherWidget(
      {@required this.location,
      @required this.temp,
      @required this.tempMin,
      @required this.tempMax,
      @required this.weather,
      @required this.humidity,
      @required this.windSpeed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
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
                      "${temp.toString()}",
                      style: TextStyle(
                          fontSize: 32,
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
                          FontAwesomeIcons.cloud,
                          color: Color(0xff5D4736),
                          size: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Text(
                          "${weather.toString()}",
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
                      "${location.toString()}",
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
                        FontAwesomeIcons.wind,
                        color: Color(0xff5D4736),
                        size: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "${windSpeed.toString()} MPH",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: GoogleFonts.openSans().fontFamily,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff5D4736)),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.15,
                      ),
                      Text(
                        "Humidity: ${humidity.toString()}%",
                        style: TextStyle(
                            fontSize: 17,
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
      ],
    );
  }
}
