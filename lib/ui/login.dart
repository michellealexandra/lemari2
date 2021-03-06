part of 'pages.dart';

class Login extends StatefulWidget {
  static const String routeName = "/login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //berhubungan dengan identitas biasanya dikasih _, buat bedain saja
  // klo kita buat identitas itu harus dipakai (buat tanda klo itu penting "_")
  final _formKey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  bool isVisible = true;
  bool isLoading = false;

  String email = '';
  String password = '';

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
                height: 430,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/login.png'),
                        fit: BoxFit.fill)),
                        
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back,",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: GoogleFonts.openSans().fontFamily,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF5D4736)),
                      ),
                      Text(
                        "Sign in to continue",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: GoogleFonts.openSans().fontFamily,
                            fontWeight: FontWeight.w700,
                            color: Color(0XFF5D4736)),
                      )
                    ],
                  ),
                ),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: size.width * 0.02,
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
                                EdgeInsets.only(left: 16, right: 16, top: 14),
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
                            password = value;
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
                            "Sign In",
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
                              //melanjutkan ke next stepe
                              setState(() {
                                isLoading = true;
                              });
                              // String msg = await AuthServices.signUp(users);
                              await AuthServices.signIn(
                                      ctrlEmail.text, ctrlPassword.text)
                                  .then((value) {
                                if (value == "Success") {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  ActivityServices.showToast("Login success");
                                  Navigator.pushReplacementNamed(
                                      context, MainMenu.routeName);
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
                                  backgroundColor: Colors.red,
                                  textColor: Colors.purple);
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
                              Text("Don't Have an Account?",
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
                                      context, Register.routeName);
                                },
                                child: Text(" Sign Up",
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
