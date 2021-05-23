part of 'pages.dart';

class Register extends StatefulWidget {
  static const String routeName = "/register";
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final ctrlName = TextEditingController();
  final ctrlPhone = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  bool isVisible = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            ListView(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    color: Color(0xffFFEFDF),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 1),
                      ),
                    ]),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: size.width * 0.06,
                            left: size.width * 0.08,
                            right: size.width * 0.08),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                              width: 1.5, color: const Color(0xffDBA878)),
                        ),
                        child: TextFormField(
                          controller: ctrlName,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            hintText: "Name",
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 16, right: 16),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please fill the field";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: size.width * 0.06,
                            left: size.width * 0.08,
                            right: size.width * 0.08),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                              width: 1.5, color: const Color(0xffDBA878)),
                        ),
                        child: TextFormField(
                          controller: ctrlEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Email",
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 16, right: 16),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please fill the field";
                            } else {
                              if (!EmailValidator.validate(value)) {
                                return "Email isn't valid";
                              } else {
                                return null;
                              }
                            }
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: size.width * 0.06,
                            left: size.width * 0.08,
                            right: size.width * 0.08),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                              width: 1.5, color: const Color(0xffDBA878)),
                        ),
                        child: TextFormField(
                          controller: ctrlPassword,
                          obscureText: isVisible,
                          decoration: InputDecoration(
                            hintText: "Password",
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 16, right: 16),
                            suffixIcon: new GestureDetector(
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: Icon(isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            //if ini maka ini -> ?
                            return value.length < 6
                                ? "Password must have 6 or more characters"
                                : null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: size.width * 0.08, right: size.width * 0.08),
                        child: ElevatedButton(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color(0xff5D4736),
                                fontFamily: GoogleFonts.openSans().fontFamily,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                              onPrimary: Color(0xff5D4736),
                              primary: Color(0xffD6AA8E),
                              elevation: 5,
                              minimumSize:
                                  Size(double.infinity, size.height * 0.07),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              Users users = new Users(
                                  "",
                                  ctrlName.text,
                                  ctrlEmail.text,
                                  ctrlPassword.text,
                                  "",
                                  "",
                                  "");
                              // String msg = await AuthServices.signUp(users);
                              await AuthServices.signUp(users).then((value) {
                                if (value == "Success") {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  ActivityServices.showToast(
                                      "Register success");
                                  Navigator.pushReplacementNamed(
                                      context, Login.routeName);
                                } else {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  ActivityServices.showToast(value);
                                }
                              });
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Please check the fields",
                                  backgroundColor: Colors.redAccent,
                                  textColor: Colors.white);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text("Have an Account?",
                                  style: TextStyle(
                                      color: Color(0xff5D4736),
                                      fontFamily:
                                          GoogleFonts.openSans().fontFamily,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //tombol back hilang, klo push named ada back button
                                  Navigator.pushReplacementNamed(
                                      context, Login.routeName);
                                },
                                child: Text(" Sign In",
                                    style: TextStyle(
                                        color: Color(0xff5D4736),
                                        fontFamily:
                                            GoogleFonts.openSans().fontFamily,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  )),
            ]),
            isLoading == true ? ActivityServices.loadings() : Container()
          ],
        ),
      ),
    );
  }
}
