part of 'pages.dart';

class CardClothesLemari extends StatefulWidget {
  final Clothes clothes;
  DocumentSnapshot doc;

  CardClothesLemari({this.clothes, this.doc});
  @override
  _CardClothesLemariState createState() => _CardClothesLemariState();
}

class _CardClothesLemariState extends State<CardClothesLemari> {
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
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
                      Navigator.of(context).pop();
                      ActivityServices.showToast(
                        "Delete Data Success",
                      );
                      //   Navigator.pushReplacementNamed(
                      //       ctx, GridClothes.routeName);
                    } else {
                      ActivityServices.showToast(
                        "Delete Data gak Success",
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

  Widget checkStatus() {
    Clothes baju = widget.clothes;
    final Size size = MediaQuery.of(context).size;
    if (baju.clothesStatus == "Closet") {
      return Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/icons/Lemari.png"))),
        width: size.width * 0.07,
        height: size.height * 0.07,
      );
    } else {
      return Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/icons/Mesin.png"))),
        width: size.width * 0.07,
        height: size.height * 0.07,
      );
    }
  }

  Widget clothesTag() {
    Clothes baju = widget.clothes;
    final Size size = MediaQuery.of(context).size;
    if (baju.clothesTag == "Top") {
      return Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/icons/Shirt.png"))),
        width: size.width * 0.07,
        height: size.height * 0.07,
      );
    } else if (baju.clothesTag == "Bottom") {
      return Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/icons/Pants.png"))),
        width: size.width * 0.07,
        height: size.height * 0.07,
      );
    } else if (baju.clothesTag == "Dress") {
      return Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/icons/Dress.png"))),
        width: size.width * 0.07,
        height: size.height * 0.07,
      );
    } else if (baju.clothesTag == "Outer") {
      return Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/icons/Jacket.png"))),
        width: size.width * 0.07,
        height: size.height * 0.07,
      );
    } else if (baju.clothesTag == "Accessories") {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/icons/Accessories.png"))),
        width: size.width * 0.07,
        height: size.height * 0.07,
      );
    } else {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/icons/Top.png"))),
        width: size.width * 0.07,
        height: size.height * 0.07,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Clothes baju = widget.clothes;
    final Size size = MediaQuery.of(context).size;
    if (baju == null) {
      return Container();
    } else {
      return Padding(
          padding:
              EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
          child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, DetailClothes.routeName,
                    arguments: baju);
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Color(0xffA77665),
                  ),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.015, right: size.height * 0.015),
                      child: GestureDetector(
                        onTap: () {
                          showDeleteDialog(context);
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.cancel, color: Color(0xffF0E8E1))
                            ]),
                      ),
                    ),
                    Hero(
                      tag: baju.clothesId,
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: NetworkImage(baju.clothesImage),
                      ),
                    ),
                    SizedBox(height: .0),
                    Text(
                      baju.clothesName,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: GoogleFonts.openSans().fontFamily,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffF0E8E1)),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child:
                          Container(color: Color(0xFFEBEBEB), height: 2.9657),
                    ),
                    Container(
                      color: Color(0xffF0E8E1),
                      child: Row(
                          //logo"nya
                          children: [
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            checkStatus(),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            clothesTag(),
                          ]),
                    )
                  ]))));
    }
  }
}
