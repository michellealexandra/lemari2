part of 'pages.dart';

class EditCloset extends StatefulWidget {
  static const String routeName = "/editCloset";
  @override
  _EditClosetState createState() => _EditClosetState();
}

class _EditClosetState extends State<EditCloset> {
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController ctrlName;
  TextEditingController ctrlDesc;

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
    final ctrlName = new TextEditingController(text: closet.closetName);
    final ctrlDesc = new TextEditingController(text: closet.closetDesc);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Lemari",
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
                    left: size.width * 0.05, right: size.width * 0.05),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    imageFile == null
                        ? Column(
                            children: [
                              // Text("File tidak ditemukan."),
                              Container(
                                alignment: Alignment.center,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.5,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(closet.closetImage),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              ElevatedButton(
                                child: Text("Edit Photo"),
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
                                        MediaQuery.of(context).size.width * 0.5,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
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
                                child: Text("Edit Photo"),
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
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _textInput(hint: "Name", controller: ctrlName),
                          Container(
                            margin: EdgeInsets.only(top: 24),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                          Container(
                            margin: EdgeInsets.only(bottom: size.height * 0.05),
                            child: ElevatedButton(
                              child: Text(
                                "Edit Lemari",
                                style: TextStyle(
                                    color: Color(0xff5D4736),
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              style: ElevatedButton.styleFrom(
                                  onPrimary: Color(0xff5D4736),
                                  primary: Color(0xffD6AA8E),
                                  elevation: 5,
                                  minimumSize: Size(
                                      double.infinity, size.height * 0.065),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              onPressed: () async {
                                ActivityServices.showToast("Cie ga bisa edit");
                              },
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