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

  @override
  Widget build(BuildContext context) {
    Closets closet = ModalRoute.of(context).settings.arguments;

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
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
              ),
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
                          return new Text(
                            closet.closetDesc,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: GoogleFonts.openSans().fontFamily,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff564B46)),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            softWrap: false,
                          );
                      }
                    },
                  ),
                ],
              ),
            ),
            // Categories(),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width - 30.0,
                    height: MediaQuery.of(context).size.height - 100.0,
                    child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: StreamBuilder<QuerySnapshot>(
                          stream: clothesCollection.orderBy('createdAt', descending: true).snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text("Failed to load data!");
                            }
                            // if (snapshot.connectionState == ConnectionState.waiting) {
                            //   return ActivityServices.loadings();
                            // }
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return ActivityServices.loadings();
                              default:
                                return new GridView(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, //two columns
                                    mainAxisSpacing: 0.1, //space the card
                                    childAspectRatio: 0.800,
                                  ),
                                  children: snapshot.data.docs
                                      .map((DocumentSnapshot doc) {
                                    Clothes clothes;
                                    if (doc.data()['clothesCloset'] ==
                                        closet.closetId) {
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
                                    } else {
                                      clothes = null;
                                    }
                                    return CardClothesLemari(clothes: clothes);
                                  }).toList(),
                                );
                            }
                          },
                        ))),
              ],
            ),
            SizedBox(height: 15.0)
          ],
        ),
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

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedindex = index;
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
}
