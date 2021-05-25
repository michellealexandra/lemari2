part of 'pages.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = "/dashboard";

  final Users users;
  Dashboard({this.users});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String namaUser;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Users user = widget.users;
    double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    // if (user == null) {
    //   return Container();
    // } else {
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
      body: ListView(scrollDirection: Axis.vertical, children: [
        Container(
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
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Profile.routeName);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Container(
                            height: MediaQuery.of(context).size.width * 0.15,
                            width: MediaQuery.of(context).size.width * 0.15,
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.15,
                                top: 36,
                                right:
                                    MediaQuery.of(context).size.width * 0.05),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/dummy.jpg",
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                        ),
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
                      FutureBuilder(
                        future: _userName(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          return Text(
                            "$namaUser",
                            // user.name,
                            // "Michelle",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff5D4736),
                            ),
                          );
                        },
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
                        Navigator.pushNamed(context, Lemari.routeName);
                      },
                      child: Text("See all",
                          style:
                              TextStyle(color: Colors.red[700], fontSize: 16)),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                height: size.height * 0.39,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    CardClothes(),
                    CardClothes(),
                    CardClothes(),
                    CardClothes(),
                    CardClothes(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
    // }
  }

  _userName() async {
    final userku = await FirebaseAuth.instance.currentUser.uid;
    if (userku != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userku)
          .get()
          .then((ds) {
        namaUser = ds.data()['name'];
        print(namaUser);
      });
    }
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
