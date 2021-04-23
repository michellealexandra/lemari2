part of 'pages.dart';

class Profile extends StatefulWidget {
  static const String routeName = "/profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    int _selectedItem = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",
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
              SizedBox(
                height: size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.5,
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "photo",
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.redAccent),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Michelle Alexandra Dinata",
                    style: TextStyle(
                        fontSize: 21,
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff5D4736)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "malexandra@student.ciputra.ac.id",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff81624B)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: size.width * 0.4,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                        color: Color(0xffFFEFDF),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 1),
                          ),
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          "Clothes",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff5D4736)),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Text(
                          "32",
                          style: TextStyle(
                              fontSize: 65,
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff5D4736)),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: size.width * 0.4,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                        color: Color(0xffFFEFDF),
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 1),
                          ),
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          "Closet",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff5D4736)),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Text(
                          "12",
                          style: TextStyle(
                              fontSize: 65,
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff5D4736)),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.05, right: size.width * 0.05),
                child: SizedBox(
                  width: double.infinity,
                  height: size.height * 0.07,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    color: Color(0xffFF5E63),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Profile.routeName);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontFamily: GoogleFonts.openSans().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
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
            _selectedItem = 2;
          });
        },
      ),
    );
  }
}
