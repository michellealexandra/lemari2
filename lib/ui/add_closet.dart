part of 'pages.dart';

class AddCloset extends StatefulWidget {
  static const String routeName = "/addcloset";
  @override
  _AddClosetState createState() => _AddClosetState();
}

class _AddClosetState extends State<AddCloset> {
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final ctrlName = TextEditingController();
  final ctrlDesc = TextEditingController();

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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Lemari",
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
                height: size.height * 0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   height: MediaQuery.of(context).size.width * 0.5,
                  //   width: MediaQuery.of(context).size.width * 0.5,
                  //   padding: EdgeInsets.all(20.0),
                  //   child: Text(
                  //     "photo",
                  //     textAlign: TextAlign.center,
                  //   ),
                  //   decoration: BoxDecoration(
                  //       border: Border.all(width: 1, color: Colors.redAccent),
                  //       borderRadius: BorderRadius.all(Radius.circular(16))),
                  // ),
                ],
              ),
              imageFile == null
                  ? Row(
                      children: [
                        ElevatedButton(
                          child: Text("Add Photo"),
                          onPressed: () {
                            // chooseFile();
                            showFileDialog(context);
                          },
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text("File tidak ditemukan.")
                      ],
                    )
                  : Row(
                      children: [
                        ElevatedButton(
                          child: Text("Add Photo"),
                          onPressed: () {
                            // chooseFile();
                            showFileDialog(context);
                          },
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          child: Semantics(
                            child: Image.file(
                              File(imageFile.path),
                              height: MediaQuery.of(context).size.width * 0.5,
                              width: MediaQuery.of(context).size.width * 0.5,
                            ),
                          ),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.redAccent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        ),
                      ],
                    ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _textInput(hint: "Name", controller: ctrlName),
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                            width: 1.5, color: const Color(0xffDBA878)),
                      ),
                      child: TextFormField(
                        controller: ctrlDesc,
                        keyboardType: TextInputType.text,
                        maxLines: 4,
                        maxLength: 200,
                        decoration: InputDecoration(
                          hintText: "Description",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please fill in the field!";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    // Container(
                    //   child: SizedBox(
                    //     width: double.infinity,
                    //     height: size.height * 0.06,
                    //     // ignore: deprecated_member_use
                    //     child: RaisedButton(
                    //       color: Color(0xffD6AA8E),
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.all(Radius.circular(8))),
                    //       onPressed: () {
                    //         Navigator.pushReplacementNamed(context, Lemari.routeName);
                    //         // Navigator.pushReplacementNamed(context, IsiLemari.routeName);
                    //       },
                    //       child: Text(
                    //         "Add Lemari",
                    //         style: TextStyle(
                    //             color: Color(0xff5D4736),
                    //             fontFamily: GoogleFonts.openSans().fontFamily,
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 18),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Container(
                      child: ElevatedButton(
                        child: Text(
                          "Add Lemari",
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
                                Size(double.infinity, size.height * 0.065),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () async {
                          if (_formKey.currentState.validate() &&
                              imageFile != null) {
                            setState(() {
                              isLoading = true;
                            });
                            Closets closets = Closets(
                                "",
                                ctrlName.text,
                                ctrlDesc.text,
                                "",
                                FirebaseAuth.instance.currentUser.uid,
                                "",
                                "");
                            await ClosetsServices.addClosets(closets, imageFile)
                                .then((value) {
                              if (value == true) {
                                ActivityServices.showToast("SUCCESS");
                                clearForm();
                                setState(() {
                                  isLoading = false;
                                  Navigator.pushReplacementNamed(
                                      context, Lemari.routeName);
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
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _textInput({controller, hint}) {
  return Container(
    margin: EdgeInsets.only(top: 24),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      border: Border.all(width: 1.5, color: const Color(0xffDBA878)),
    ),
    child: TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      maxLength: 12,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: hint,
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(16),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value.isEmpty) {
          return "Please fill in the field!";
        } else {
          return null;
        }
      },
    ),
  );
}
