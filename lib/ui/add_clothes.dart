part of 'pages.dart';

class AddClothes extends StatefulWidget {
  static const String routeName = "/addclothes";

  @override
  _AddClothesState createState() => _AddClothesState();
}

class _AddClothesState extends State<AddClothes> {
  final _formKey = GlobalKey<FormState>();
  final ctrlName = TextEditingController();
  final ctrlDesc = TextEditingController();
  final ctrlAge = TextEditingController();
  final ctrlCategory = TextEditingController();
  final ctrlCondition = TextEditingController();
  final ctrlLaundryDate = TextEditingController();
  bool isVisible = true;
  bool isLoading = false;

  String _chosenValue;
  String _chosenStatus;
  String radioButtonItem;
  int id = 1;

  PickedFile imageFile;
  final ImagePicker imagePicker = ImagePicker();

  Future chooseFile(String type) async {
    ImageSource imgSrc;
    if (type == "camera") {
      imgSrc = ImageSource.camera;
    } else {
      imgSrc = ImageSource.gallery;
    }

    final selectedImage = await imagePicker.getImage(
      source: imgSrc,
      imageQuality: 50,
    );
    setState(() {
      imageFile = selectedImage;
    });
  }

  void dispose() {
    ctrlName.dispose();
    ctrlDesc.dispose();
    super.dispose();
  }

  void clearForm() {
    ctrlName.clear();
    ctrlDesc.clear();
    setState(() {
      imageFile = null;
    });
  }

  void showFileDialog(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (ctx) {
          return AlertDialog(
            title: Text("Confirmation"),
            content: Text("Pick image from:"),
            actions: [
              ElevatedButton.icon(
                onPressed: () {
                  chooseFile("camera");
                },
                icon: Icon(Icons.camera_alt),
                label: Text("Camera"),
                style: ElevatedButton.styleFrom(elevation: 0),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  chooseFile("gallery");
                },
                icon: Icon(Icons.folder),
                label: Text("Gallery"),
                style: ElevatedButton.styleFrom(elevation: 0),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Closets closet = ModalRoute.of(context).settings.arguments;
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            ListView(children: [
              Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    bottom: size.width * 0.05),
                // width: size.width,
                // height: size.height * 1.2,
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.08,
                        ),
                        imageFile == null
                            ? Column(
                                children: [
                                  Text("File tidak ditemukan."),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  ElevatedButton(
                                    child: Text("Add Photo"),
                                    onPressed: () {
                                      // chooseFile();
                                      showFileDialog(context);
                                    },
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Container(
                                    child: Semantics(
                                      child: Image.file(
                                        File(imageFile.path),
                                        fit: BoxFit.cover,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                      ),
                                    ),
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
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  ElevatedButton(
                                    child: Text("Add Photo"),
                                    onPressed: () {
                                      // chooseFile();
                                      showFileDialog(context);
                                    },
                                  ),
                                ],
                              ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _textInputClothes(hint: "Name", controller: ctrlName),
                          Container(
                            margin: EdgeInsets.only(top: 18),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              border: Border.all(
                                  width: 1.5, color: const Color(0xffDBA878)),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: ctrlDesc,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              border: Border.all(
                                  width: 1.5, color: const Color(0xffDBA878)),
                            ),
                            child: TextField(
                              readOnly: true,
                              controller: ctrlAge,
                              decoration: InputDecoration(
                                  hintText: 'Clothes Age',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(16)),
                              onTap: () async {
                                var date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));
                                ctrlAge.text = date.toString().substring(0, 10);
                              },
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              border: Border.all(
                                  width: 1.5, color: const Color(0xffDBA878)),
                            ),
                            child: TextField(
                              readOnly: true,
                              controller: ctrlLaundryDate,
                              decoration: InputDecoration(
                                  hintText: 'Laundry Date',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(16)),
                              onTap: () async {
                                var date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));
                                ctrlLaundryDate.text =
                                    date.toString().substring(0, 10);
                              },
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                // onPressed: () {
                                //   Navigator.pushReplacementNamed(
                                //       context, IsiLemari.routeName);
                                // },
                                onPressed: () async {
                                  if (_formKey.currentState.validate() &&
                                      imageFile != null) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    Clothes clothes = Clothes(
                                        "",
                                        ctrlName.text,
                                        ctrlDesc.text,
                                        closet.closetId,
                                        "",
                                        ctrlAge.text,
                                        _chosenValue,
                                        radioButtonItem,
                                        ctrlLaundryDate.text,
                                        "",
                                        "");
                                    await ClothesServices.addClothes(
                                            clothes, closet, imageFile)
                                        .then((value) {
                                      if (value == true) {
                                        ActivityServices.showToast("SUCCESS");
                                        clearForm();
                                        setState(() {
                                          isLoading = false;
                                          Navigator.pushReplacementNamed(
                                              context, IsiLemari.routeName);
                                        });
                                      } else {
                                        ActivityServices.showToast("FAILED");
                                      }
                                    });
                                  } else {
                                    ActivityServices.showToast(
                                        "Please check form fields!");
                                  }
                                },
                                child: Text(
                                  "Add Clothes",
                                  style: TextStyle(
                                      color: Color(0xff5D4736),
                                      fontFamily:
                                          GoogleFonts.openSans().fontFamily,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
            isLoading == true ? ActivityServices.loadings() : Container()
          ],
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
