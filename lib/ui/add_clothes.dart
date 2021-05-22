part of 'pages.dart';

class AddClothes extends StatefulWidget {
  static const String routeName = "/addclothes";
  @override
  _AddClothesState createState() => _AddClothesState();
}

class _AddClothesState extends State<AddClothes> {
  bool isLoading = false;
  String _chosenValue;
  String radioButtonItem = 'Closet';

  int id = 1;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Clothes",
            style: TextStyle(
                color: Color(0xff564B46),
                fontFamily: GoogleFonts.openSans().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 24)),
        backgroundColor: Color(0xffFFFFFF).withOpacity(0.5),
        elevation: 0.0,
      ),
      resizeToAvoidBottomInset: false,
      body: ListView(children: [
        Container(
          margin: EdgeInsets.only(
              left: size.width * 0.05, right: size.width * 0.05, bottom: size.width*0.05),
          // width: size.width,
          // height: size.height * 1.2,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                child: SizedBox(
                  width: size.width * 0.5,
                  height: size.height * 0.04,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    color: Color(0xffD6AA8E),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    onPressed: () {
                      // showFileDialog(context);
                    },
                    child: Text(
                      "Add Photo",
                      style: TextStyle(
                          color: Color(0xff5D4736),
                          fontFamily: GoogleFonts.openSans().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                ),
              ),
              _textInputClothes(hint: "Name"),
              Container(
                margin: EdgeInsets.only(top: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border:
                      Border.all(width: 1.5, color: const Color(0xffDBA878)),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  maxLines: 3,
                  maxLength: 250,
                  decoration: InputDecoration(
                    hintText: "Description",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border:
                      Border.all(width: 1.5, color: const Color(0xffDBA878)),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  // controller: controller,
                  decoration: InputDecoration(
                    hintText: "Date",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: DropdownButton<String>(
                  focusColor: Colors.white,
                  value: _chosenValue,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: <String>[
                    'Top',
                    'Bottom',
                    'Dress',
                    'Outer',
                    'Accessories'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    "Please choose one",
                    style: TextStyle(
                        color: Color(0xff5D4736),
                        fontSize: 14,
                        fontFamily: GoogleFonts.lato().fontFamily,
                        fontWeight: FontWeight.w300),
                  ),
                  onChanged: (String value) {
                    setState(() {
                      _chosenValue = value;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Laundry';
                        id = 1;
                      });
                    },
                  ),
                  Text(
                    'Laundry',
                    style: new TextStyle(fontSize: 14.0),
                  ),
                  SizedBox(
                    width: size.width * 0.2,
                  ),
                  Radio(
                    value: 2,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        radioButtonItem = 'Closet';
                        id = 2;
                      });
                    },
                  ),
                  Text(
                    'Closet',
                    style: new TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border:
                      Border.all(width: 1.5, color: const Color(0xffDBA878)),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  // controller: controller,
                  decoration: InputDecoration(
                    hintText: "Date",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              Container(
                child: SizedBox(
                  width: double.infinity,
                  height: size.height * 0.06,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    color: Color(0xffD6AA8E),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, IsiLemari.routeName);
                    },
                    child: Text(
                      "Add Lemari",
                      style: TextStyle(
                          color: Color(0xff5D4736),
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
      ]),
    );
  }
}

Widget _textInputClothes({controller, hint}) {
  return Container(
    margin: EdgeInsets.only(top: 18),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      border: Border.all(width: 1.5, color: const Color(0xffDBA878)),
    ),
    child: TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(16),
      ),
    ),
  );
}
