part of 'pages.dart';

class DetailClothes extends StatefulWidget {
  static const String routeName = "/detailclothes";
  final Clothes clothes;
  DetailClothes({this.clothes});
  @override
  _DetailClothesState createState() => _DetailClothesState();
}

class _DetailClothesState extends State<DetailClothes> {
  CollectionReference clothesCollection =
      FirebaseFirestore.instance.collection("clothes");
  void showDeleteDialog(BuildContext ctx) {
    Clothes clothes = widget.clothes;
    showDialog(
        context: ctx,
        builder: (ctx) {
          return AlertDialog(
            title: Text("Confirmation"),
            content: Text("Are you sure you want to delete this clothes?"),
            actions: [
              ElevatedButton(
                  onPressed: () {Navigator.of(context).pop();},
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
                  onPressed: () async {
                    bool result =
                        await ClothesServices.deleteClothes(clothes.clothesId);
                    if (result) {
                      ActivityServices.showToast(
                        "Delete Data Success",
                      );
                      Navigator.pushReplacementNamed(
                          ctx, GridClothes.routeName);
                    } else {
                      ActivityServices.showToast(
                        "Delete Data Success",
                      );
                    }
                  },
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

  @override
  Widget build(BuildContext context) {
    Clothes baju = ModalRoute.of(context).settings.arguments;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Clothes Detail",
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
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.07,
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ActivityServices.showToast(
                                "Will be done at 24 August 2021");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/icons/Mesin.png"))),
                            width: size.width * 0.13,
                            height: size.height * 0.13,
                          ),
                        ),
                        SizedBox(
                          height: size.width * 0.005,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/icons/Dress.png"))),
                          width: size.width * 0.13,
                          height: size.height * 0.13,
                        ),
                        SizedBox(
                          height: size.width * 0.005,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, EditClothes.routeName);
                          },
                          child: Container(
                            child: Icon(
                              Icons.edit,
                              color: Color(0xff5D4736),
                              size: size.width * 0.1,
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xffFCD825),
                                shape: BoxShape.circle),
                            width: size.width * 0.13,
                            height: size.height * 0.13,
                          ),
                        ),
                        SizedBox(
                          height: size.width * 0.005,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDeleteDialog(context);
                          },
                          child: Container(
                            child: Icon(
                              Icons.delete,
                              color: Color(0xff5D4736),
                              size: size.width * 0.1,
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xffFF5E63),
                                shape: BoxShape.circle),
                            width: size.width * 0.13,
                            height: size.height * 0.13,
                          ),
                        ),
                        SizedBox(
                          height: size.width * 0.005,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: size.width * 0.7,
                        height: size.height * 0.6,
                        decoration: BoxDecoration(
                          //https://www.codegrepper.com/code-examples/dart/flutter+fill+an+image+in+a+container
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/dummy.jpg")),
                          //https://googleflutter.com/flutter-border-around-image/
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(18.0)),
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
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: size.width * 0.08,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StreamBuilder<QuerySnapshot>(
                      stream: clothesCollection.snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text("Failed to load data!");
                        }
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return ActivityServices.loadings();
                          default:
                            return new Text(baju.clothesAge,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0xff564B46)),
                                textAlign: TextAlign.left);
                        }
                      },
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: clothesCollection.snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text("Failed to load data!");
                        }
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return ActivityServices.loadings();
                          default:
                            return new Text(baju.clothesName,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff564B46)),
                                textAlign: TextAlign.left);
                        }
                      },
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: clothesCollection.snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text("Failed to load data!");
                        }
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return ActivityServices.loadings();
                          default:
                            return new Text(baju.clothesDesc,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff564B46)),
                                textAlign: TextAlign.left);
                        }
                      },
                    ),
                    Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s ",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: GoogleFonts.openSans().fontFamily,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff564B46)),
                        textAlign: TextAlign.left)
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}
