part of 'pages.dart';

class GridClothes extends StatefulWidget {
  static const String routeName = "/GridClothes";
  final log = Logger(
      printer: PrettyPrinter(
          methodCount: 0,
          errorMethodCount: 3,
          lineLength: 50,
          colors: true,
          printEmojis: true,
          printTime: false));

  final Clothes clothes;
  final Closets closets;
  GridClothes({this.clothes, this.closets});
  @override
  _GridClothesState createState() => _GridClothesState();
}

class _GridClothesState extends State<GridClothes> {
  CollectionReference clothesCollection =
      FirebaseFirestore.instance.collection("clothes");
  CollectionReference closetsCollection =
      FirebaseFirestore.instance.collection("closets");
  TextEditingController _searchController = TextEditingController();
  String clothesName;
  bool searchState = false;
  List<String> categories = [
    "All",
    "Top",
    "Bottom",
    "Dress",
    "Outer",
    "Accessories"
  ];
  int selectedindex = 0;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  _onSearchChanged() {
    print(_searchController.text);
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedindex = index;
          print(selectedindex);
        });
      },
      child: Padding(
        //antar word top bottom etc
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.openSans().fontFamily,
                fontSize: 14,
                color: selectedindex == index
                    ? Color(0xff5D4736)
                    : Color(0xffE4E0DC),
              ),
            ),
            Container(
              //antar word dan garis
              margin: EdgeInsets.only(top: 20 / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedindex == index
                  ? Color(0xff5D4736)
                  : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

  Widget filterClothes() {
    final Size size = MediaQuery.of(context).size;
    Closets closet = ModalRoute.of(context).settings.arguments;
    if (selectedindex == 1) {
      return StreamBuilder<QuerySnapshot>(
        stream: clothesCollection
            .where('clothesTag', isEqualTo: 'Top')
            .where('clothesCloset', isEqualTo: closet.closetId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text("Failed to load data!");
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return ActivityServices.loadings();
            default:
              return Container(
                padding: EdgeInsets.only(bottom: size.height * 0.05),
                child: new GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //two columns
                    mainAxisSpacing: 0.1, //space the card
                    childAspectRatio: 0.800,
                  ),
                  children: snapshot.data.docs.map((DocumentSnapshot doc) {
                    Clothes clothes;
                    clothes = new Clothes(
                      doc.data()['clothesId'],
                      doc.data()['clothesName'],
                      doc.data()['clothesDesc'],
                      doc.data()['clothesImage'],
                      doc.data()['clothesCloset'],
                      doc.data()['clothesAddBy'],
                      doc.data()['clothesAge'],
                      doc.data()['clothesTag'],
                      doc.data()['clothesStatus'],
                      doc.data()['clothesLaundry'],
                      doc.data()['createdAt'],
                      doc.data()['updatedAt'],
                    );
                    return CardClothesLemari(clothes: clothes);
                  }).toList(),
                ),
              );
          }
        },
      );
    } else if (selectedindex == 2) {
      return StreamBuilder<QuerySnapshot>(
        stream: clothesCollection
            .where('clothesTag', isEqualTo: 'Bottom')
            .where('clothesCloset', isEqualTo: closet.closetId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text("Failed to load data!");
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return ActivityServices.loadings();
            default:
              return Container(
                padding: EdgeInsets.only(bottom: size.height * 0.05),
                child: new GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //two columns
                    mainAxisSpacing: 0.1, //space the card
                    childAspectRatio: 0.800,
                  ),
                  children: snapshot.data.docs.map((DocumentSnapshot doc) {
                    Clothes clothes;
                    clothes = new Clothes(
                      doc.data()['clothesId'],
                      doc.data()['clothesName'],
                      doc.data()['clothesDesc'],
                      doc.data()['clothesImage'],
                      doc.data()['clothesCloset'],
                      doc.data()['clothesAddBy'],
                      doc.data()['clothesAge'],
                      doc.data()['clothesTag'],
                      doc.data()['clothesStatus'],
                      doc.data()['clothesLaundry'],
                      doc.data()['createdAt'],
                      doc.data()['updatedAt'],
                    );
                    return CardClothesLemari(clothes: clothes);
                  }).toList(),
                ),
              );
          }
        },
      );
    } else if (selectedindex == 3) {
      return StreamBuilder<QuerySnapshot>(
        stream: clothesCollection
            .where('clothesTag', isEqualTo: 'Dress')
            .where('clothesCloset', isEqualTo: closet.closetId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text("Failed to load data!");
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return ActivityServices.loadings();
            default:
              return Container(
                padding: EdgeInsets.only(bottom: size.height * 0.05),
                child: new GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //two columns
                    mainAxisSpacing: 0.1, //space the card
                    childAspectRatio: 0.800,
                  ),
                  children: snapshot.data.docs.map((DocumentSnapshot doc) {
                    Clothes clothes;
                    clothes = new Clothes(
                      doc.data()['clothesId'],
                      doc.data()['clothesName'],
                      doc.data()['clothesDesc'],
                      doc.data()['clothesImage'],
                      doc.data()['clothesCloset'],
                      doc.data()['clothesAddBy'],
                      doc.data()['clothesAge'],
                      doc.data()['clothesTag'],
                      doc.data()['clothesStatus'],
                      doc.data()['clothesLaundry'],
                      doc.data()['createdAt'],
                      doc.data()['updatedAt'],
                    );
                    return CardClothesLemari(clothes: clothes);
                  }).toList(),
                ),
              );
          }
        },
      );
    } else if (selectedindex == 4) {
      return StreamBuilder<QuerySnapshot>(
        stream: clothesCollection
            .where('clothesTag', isEqualTo: 'Outer')
            .where('clothesCloset', isEqualTo: closet.closetId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text("Failed to load data!");
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return ActivityServices.loadings();
            default:
              return Container(
                padding: EdgeInsets.only(bottom: size.height * 0.05),
                child: new GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //two columns
                    mainAxisSpacing: 0.1, //space the card
                    childAspectRatio: 0.800,
                  ),
                  children: snapshot.data.docs.map((DocumentSnapshot doc) {
                    Clothes clothes;
                    clothes = new Clothes(
                      doc.data()['clothesId'],
                      doc.data()['clothesName'],
                      doc.data()['clothesDesc'],
                      doc.data()['clothesImage'],
                      doc.data()['clothesCloset'],
                      doc.data()['clothesAddBy'],
                      doc.data()['clothesAge'],
                      doc.data()['clothesTag'],
                      doc.data()['clothesStatus'],
                      doc.data()['clothesLaundry'],
                      doc.data()['createdAt'],
                      doc.data()['updatedAt'],
                    );
                    return CardClothesLemari(clothes: clothes);
                  }).toList(),
                ),
              );
          }
        },
      );
    } else if (selectedindex == 5) {
      return StreamBuilder<QuerySnapshot>(
        stream: clothesCollection
            .where('clothesTag', isEqualTo: 'Accessories')
            .where('clothesCloset', isEqualTo: closet.closetId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text("Failed to load data!");
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return ActivityServices.loadings();
            default:
              return Container(
                padding: EdgeInsets.only(bottom: size.height * 0.05),
                child: new GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //two columns
                    mainAxisSpacing: 0.1, //space the card
                    childAspectRatio: 0.800,
                  ),
                  children: snapshot.data.docs.map((DocumentSnapshot doc) {
                    Clothes clothes;
                    clothes = new Clothes(
                      doc.data()['clothesId'],
                      doc.data()['clothesName'],
                      doc.data()['clothesDesc'],
                      doc.data()['clothesImage'],
                      doc.data()['clothesCloset'],
                      doc.data()['clothesAddBy'],
                      doc.data()['clothesAge'],
                      doc.data()['clothesTag'],
                      doc.data()['clothesStatus'],
                      doc.data()['clothesLaundry'],
                      doc.data()['createdAt'],
                      doc.data()['updatedAt'],
                    );
                    return CardClothesLemari(clothes: clothes);
                  }).toList(),
                ),
              );
          }
        },
      );
    } else {
      return StreamBuilder<QuerySnapshot>(
        stream: clothesCollection
            .where('clothesCloset', isEqualTo: closet.closetId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text("Failed to load data!");
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return ActivityServices.loadings();
            default:
              return Container(
                padding: EdgeInsets.only(bottom: size.height * 0.05),
                child: new GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //two columns
                    mainAxisSpacing: 0.1, //space the card
                    childAspectRatio: 0.800,
                  ),
                  children: snapshot.data.docs.map((DocumentSnapshot doc) {
                    Clothes clothes;
                    clothes = new Clothes(
                      doc.data()['clothesId'],
                      doc.data()['clothesName'],
                      doc.data()['clothesDesc'],
                      doc.data()['clothesImage'],
                      doc.data()['clothesCloset'],
                      doc.data()['clothesAddBy'],
                      doc.data()['clothesAge'],
                      doc.data()['clothesTag'],
                      doc.data()['clothesStatus'],
                      doc.data()['clothesLaundry'],
                      doc.data()['createdAt'],
                      doc.data()['updatedAt'],
                    );
                    return CardClothesLemari(clothes: clothes);
                  }).toList(),
                ),
              );
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Closets closet = ModalRoute.of(context).settings.arguments;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: StreamBuilder<QuerySnapshot>(
            stream: closetsCollection.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Failed to load data!");
              }
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return ActivityServices.loadings();
                default:
                  return new Text(
                    closet.closetName,
                    style: TextStyle(
                        color: Color(0xff564B46),
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  );
              }
            },
          ),
          backgroundColor: Color(0xffFFFFFF).withOpacity(0.5),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  // showSearch(context: context, delegate: DataDummy());
                },
                icon: Icon(Icons.search))
          ],
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFFCFAF8),
        body: ListView(children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StreamBuilder<QuerySnapshot>(
                      stream: closetsCollection.snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text("Failed to load data!");
                        }
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return ActivityServices.loadings();
                          default:
                            return Container(
                              margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05,
                                right: MediaQuery.of(context).size.width * 0.05,
                              ),
                              child: new Text(
                                closet.closetDesc,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff564B46)),
                              ),
                            );
                        }
                      },
                    ),
                    // Text("HALO"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SizedBox(
                        height: 30,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) => buildCategory(index),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width - 30.0,
                          height: MediaQuery.of(context).size.height - 100.0,
                          child: Container(child: filterClothes())),
                    )
                  ],
                ),
              ),
            ],
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddClothes.routeName,
                arguments: closet);
            print(closet);
          },
          child: const Icon(Icons.add),
          backgroundColor: Color(0xffFFEFDF),
          foregroundColor: Color(0xff5D4736),
        ));
  }
}
