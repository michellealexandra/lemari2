part of 'dashboard.dart';

class Dashboard2 extends StatefulWidget {
  static const String routeName = "/dashboard2";

  @override
  _Dashboard2State createState() => _Dashboard2State();
}

class _Dashboard2State extends State<Dashboard2> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard",
            style: TextStyle(
                color: Color(0xff564B46),
                fontFamily: GoogleFonts.openSans().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 24)),
        backgroundColor: Color(0xffFFFFFF).withOpacity(0.5),
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
              WelcomeText(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              WeatherDash(),
              WeatherDash2(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              RecentItem(),
              RecentCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xffDCB997),
        height: 70,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.storage), label: "Lemari"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
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
