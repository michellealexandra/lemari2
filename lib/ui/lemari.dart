part of 'pages.dart';

class Lemari extends StatefulWidget {
  static const String routeName = "/lemari";

  @override
  _LemariState createState() => _LemariState();
}

class _LemariState extends State<Lemari> {
  TextEditingController _searchController = TextEditingController();
  String closetName;
  bool searchState = false;
  CollectionReference closetCollection =
      FirebaseFirestore.instance.collection("closets");

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

  // getLemariStreamSnapshots()async{
  //   BuildContext context ad
  // }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<String> items =
        new List<String>.generate(30, (i) => "Items ${i + 1}");
    return Scaffold(
      appBar: AppBar(
        title: !searchState
            ? Text("Lemari",
                style: TextStyle(
                    color: Color(0xff564B46),
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 24))
            : TextField(
                controller: _searchController,
                // onChanged: (val) {
                //   setState(() {
                //     closetName = val.toLowerCase().trim();
                //   });
                // },
                decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Color(0xffbbbbbb))),
              ),
        backgroundColor: Color(0xffFFFFFF).withOpacity(0.5),
        elevation: 0.0,
        actions: <Widget>[
          !searchState
              ? IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      searchState = !searchState;
                    });
                    // showSearch(
                    //   context: context,
                    //   delegate: DataSearch(),
                    // );
                  })
              : IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      searchState = !searchState;
                    });
                  }),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddCloset.routeName);
        },
        child: const Icon(Icons.add),
        backgroundColor: Color(0xffFFEFDF),
        foregroundColor: Color(0xff5D4736),
      ),
    );
  }

  Widget buildBody() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream:
              // (closetName == null || closetName.trim() == "")
              //     ? closetCollection.snapshots()
              //     : closetCollection
              //         .where("closetName", arrayContains: closetName)
              //         .snapshots(),

              closetCollection.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                return new ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot doc) {
                    Closets closets;
                    if (doc.data()['closetAddby'] ==
                        FirebaseAuth.instance.currentUser.uid) {
                      closets = new Closets(
                        doc.data()['closetId'],
                        doc.data()['closetName'],
                        doc.data()['closetDesc'],
                        doc.data()['closetImage'],
                        doc.data()['closetAddby'],
                        doc.data()['createdAt'],
                        doc.data()['updatedAt'],
                      );
                    } else {
                      closets = null;
                    }
                    return CardLemari(closets: closets);
                  }).toList(),
                );
            }
          },
        ));
  }
}
