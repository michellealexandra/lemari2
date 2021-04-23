part of 'pages.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = "/dashboard";

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);

    int _selectedItem = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard",
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
            children: [
              // addVerticalSpace(padding),
              Row(
                children: [
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.height * 0.12,
                  // ),
                  //photo
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.15,
                        width: MediaQuery.of(context).size.width * 0.15,
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.15,
                            top: 36,
                            right: MediaQuery.of(context).size.width * 0.05),
                        padding: EdgeInsets.all(20.0),
                        child: Text("photo"),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Colors.redAccent),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                      ),
                    ],
                  ),
                  //text welcome dan name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text(
                        "Welcome",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: GoogleFonts.openSans().fontFamily,
                            fontWeight: FontWeight.w200,
                            color: Color(0xff8B827B)),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        "Michelle Alexandra",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: GoogleFonts.openSans().fontFamily,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff5D4736),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Row(
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
                                      fontFamily:
                                          GoogleFonts.openSans().fontFamily,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Text(
                                      "Sunny day",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily:
                                              GoogleFonts.openSans().fontFamily,
                                          fontWeight: FontWeight.w900,
                                          color: Color(0xff5D4736)),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Text(
                                  "Lidah Kulon, Surabaya",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily,
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Items",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: GoogleFonts.openSans().fontFamily,
                          fontWeight: FontWeight.w900,
                          color: Color(0xff5D4736)),
                      textAlign: TextAlign.right,
                    ),
                    GestureDetector(
                      onTap: () {
                        //tombol back hilang, klo push named ada back button
                        // Navigator.pushReplacementNamed(
                        //     context, Lemari.routeName);
                      },
                      child: Text("See all",
                          style:
                              TextStyle(color: Colors.red[700], fontSize: 16)),
                    )
                  ],
                ),
              ),

              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Card(
                    elevation: 5,
                    color: Color(0xffEDD3B9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
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
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(14.0))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage("assets/images/dummy.jpg"),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Text(
                                "Brown Cookies",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily,
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
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(14.0))),
                          child: Column(
                              //logo"nya
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // ignore: deprecated_member_use
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storage),
            // ignore: deprecated_member_use
            title: Text('Lemari'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            // ignore: deprecated_member_use
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedItem,
        onTap: (index) {
          setState(() {
            _selectedItem = index;
          });
        },
      ),
    );
  }
}

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Widget cardTemp(color) {
  return Container(
    height: 140,
    width: double.infinity,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20.0),
    ),
  );
}
