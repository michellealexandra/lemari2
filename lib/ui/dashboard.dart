part of 'pages.dart';

Future<WeatherInfo> fetchWeather() async {
  final city = "Surabaya";
  final apiKey = "caab7dc58efbe04cd08befb62e3662d9";
  final requestUrl =
      "http://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${apiKey}";

  final response = await http.get(Uri.parse(requestUrl));

  if (response.statusCode == 200) {
    return WeatherInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Error Loading Request URL info");
  }
}

class WeatherInfo {
  final String location;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String weather;
  final int humidity;
  final double windSpeed;

  WeatherInfo(
      {@required this.location,
      @required this.temp,
      @required this.tempMin,
      @required this.tempMax,
      @required this.weather,
      @required this.humidity,
      @required this.windSpeed});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
        location: json['name'],
        temp: json['main']['temp'],
        tempMin: json['main']['temp_min'],
        tempMax: json['main']['temp_max'],
        weather: json['weather'][0]['description'],
        humidity: json['main']['humidity'],
        windSpeed: json['wind']['speed']);
  }
}

class Dashboard extends StatefulWidget {
  static const String routeName = "/dashboard";

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  CollectionReference clothesCollection =
      FirebaseFirestore.instance.collection("clothes");
  String namaUser;

  Future<WeatherInfo> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
              Row(
                children: [
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
              FutureBuilder<WeatherInfo>(
                future: futureWeather,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return WeatherWidget(
                        location: snapshot.data.location,
                        temp: snapshot.data.temp,
                        tempMin: snapshot.data.tempMin,
                        tempMax: snapshot.data.tempMax,
                        weather: snapshot.data.weather,
                        humidity: snapshot.data.humidity,
                        windSpeed: snapshot.data.windSpeed);
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  }
                  return CircularProgressIndicator();
                },
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
                  child: StreamBuilder<QuerySnapshot>(
                    stream: clothesCollection.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text("Failed to load data!");
                      }
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return ActivityServices.loadings();
                        default:
                          return new ListView(
                            scrollDirection: Axis.horizontal,
                            children:
                                snapshot.data.docs.map((DocumentSnapshot doc) {
                              Clothes clothes;
                              clothes = new Clothes(
                                doc.data()['clothesId'],
                                doc.data()['clothesName'],
                                doc.data()['clothesDesc'],
                                doc.data()['clothesImage'],
                                doc.data()['clothesCloset'],
                                doc.data()['clothesAge'],
                                doc.data()['clothesTag'],
                                doc.data()['clothesStatus'],
                                doc.data()['clothesLaundry'],
                                doc.data()['createdAt'],
                                doc.data()['updatedAt'],
                              );
                              return CardClothes(clothes: clothes);
                            }).toList(),
                          );
                      }
                    },
                  )
                  // ListView(
                  //   scrollDirection: Axis.horizontal,
                  //   children: <Widget>[
                  //     CardClothes(),
                  //     CardClothes(),
                  //     CardClothes(),
                  //     CardClothes(),
                  //     CardClothes(),
                  //   ],
                  // ),
                  ),
            ],
          ),
        ),
      ]),
    );
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
