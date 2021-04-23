part of 'pages.dart';

class Register extends StatefulWidget {
  static const String routeName = "/register";
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
      //   elevation: 0,
      // ),
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: <Widget>[
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
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.08,
                    right: size.width * 0.08,
                    top: size.width * 0.05),
                child: Column(
                  children: <Widget>[
                    _textInput(hint: "Name"),
                    _textInput(hint: "Email"),
                    _textInput(hint: "Password"),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Flexible(
                      child: SizedBox(
                        width: double.infinity,
                        height: size.height * 0.07,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          color: Color(0xffD6AA8E),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Profile.routeName);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Color(0xff5D4736),
                                fontFamily: GoogleFonts.openSans().fontFamily,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Have an account?",
                    style: TextStyle(
                        color: Color(0xff5D4736),
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.w500)),
                TextSpan(
                    text: " Sign In",
                    style: TextStyle(
                        color: Color(0xff5D4736),
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.bold)),
              ])),
            )
          ],
        ),
      ),
    );
  }

  Widget _textInput({controller, hint}) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(width: 1.5, color: const Color(0xffDBA878)),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 16),
        ),
      ),
    );
  }
}
