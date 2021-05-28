part of 'pages.dart';

class Profile extends StatefulWidget {
  static const String routeName = "/profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String namaUser, emailUser;
  void showConfirmationDialog(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (ctx) {
          return AlertDialog(
            title: Text("Confirmation"),
            content: Text("Are you sure you want to delete this picture?"),
            actions: [
              ElevatedButton(
                  onPressed: () {Navigator.of(ctx).pop();},
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  style: ElevatedButton.styleFrom(
                      onPrimary: Color(0xff5D4736),
                      primary: Color(0xffbbbbbb),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)))),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Delete",
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  style: ElevatedButton.styleFrom(
                      onPrimary: Color(0xff5D4736),
                      primary: Color(0xffFF5E63),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)))),
            ],
          );
        });
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
      body: Stack(children: [
        SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext ctx) {
                              return Container(
                                width: double.infinity,
                                height: 72,
                                // color: Color(0xffFFEFDF),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        child: Text(
                                          "Edit Photo",
                                          style: TextStyle(
                                              color: Color(0xffFFFFFF),
                                              fontFamily: GoogleFonts.openSans()
                                                  .fontFamily,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            onPrimary: Color(0xff5D4736),
                                            primary: Color(0xffD5A475),
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, EditProfile.routeName);
                                        },
                                      ),
                                      ElevatedButton(
                                        child: Text(
                                          "Delete Photo",
                                          style: TextStyle(
                                              color: Color(0xffFFFFFF),
                                              fontFamily: GoogleFonts.openSans()
                                                  .fontFamily,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            onPrimary: Color(0xff5D4736),
                                            primary: Color(0xffFF5E63),
                                            elevation: 3,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                        onPressed: () {
                                          showConfirmationDialog(context);
                                        },
                                      )
                                    ]),
                              );
                            });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Container(
                          height: size.width * 0.5,
                          width: size.width * 0.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
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
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder(
                      future: _userName(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return Text(
                          "$namaUser",
                          style: TextStyle(
                              fontSize: 21,
                              fontFamily: GoogleFonts.lato().fontFamily,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff5D4736)),
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder(
                      future: _userEmail(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return Text(
                          "$emailUser",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: GoogleFonts.lato().fontFamily,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff81624B)),
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
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
                      onPressed: () async {
                        //melanjutkan ke next stepe
                        setState(() {
                          isLoading = true;
                        });
                        // String msg = await AuthServices.signUp(users);
                        await AuthServices.signOut().then((value) {
                          if (value) {
                            setState(() {
                              isLoading = false;
                            });
                            ActivityServices.showToast("Logout success");
                            Navigator.pushReplacementNamed(
                                context, Login.routeName);
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                            ActivityServices.showToast("Logout Failed");
                          }
                        });
                      },
                      child: Text(
                        "Sign Out",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontFamily: GoogleFonts.openSans().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
                isLoading == true ? ActivityServices.loadings() : Container()
              ],
            ),
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

  _userEmail() async {
    final userku = await FirebaseAuth.instance.currentUser.uid;
    if (userku != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userku)
          .get()
          .then((ds) {
        emailUser = ds.data()['email'];
        print(emailUser);
      });
    }
  }
}
