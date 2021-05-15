part of 'pages.dart';

class AddClothes extends StatefulWidget {
  static const String routeName = "/addclothes";
  @override
  _AddClothesState createState() => _AddClothesState();
}

class _AddClothesState extends State<AddClothes> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    String _myActivity;
    String _myActivityResult;
    final formKey = new GlobalKey<FormState>();

    @override
    void initState() {
      super.initState();
      _myActivity = '';
      _myActivityResult = '';
    }

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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              left: size.width * 0.05, right: size.width * 0.05),
          width: size.width,
          height: size.height,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.06,
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
                    onPressed: () {},
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
                margin: EdgeInsets.only(top: 18),
                child: DropDownFormField(
                  titleText: 'Clothes Type',
                  hintText: 'Please choose one',
                  value: _myActivity,
                  onSaved: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Top",
                      "value": "Top",
                    },
                    {
                      "display": "Bottom",
                      "value": "Bottom",
                    },
                    {
                      "display": "Dress",
                      "value": "Dress",
                    },
                    {
                      "display": "Outer",
                      "value": "Outer",
                    },
                    {
                      "display": "Accessories",
                      "value": "Accessories",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
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
      ),
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
