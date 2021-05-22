part of 'pages.dart';

class Lemari extends StatefulWidget {
  static const String routeName = "/lemari";

  @override
  _LemariState createState() => _LemariState();
}

class _LemariState extends State<Lemari> {
  CollectionReference closetCollection =
      FirebaseFirestore.instance.collection("closets");
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<String> items =
        new List<String>.generate(30, (i) => "Items ${i + 1}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Lemari",
            style: TextStyle(
                color: Color(0xff564B46),
                fontFamily: GoogleFonts.openSans().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 24)),
        backgroundColor: Color(0xffFFFFFF).withOpacity(0.5),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: Icon(Icons.search))
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
            stream: closetCollection.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Failed to load data!");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ActivityServices.loadings();
              }
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
          },
        ));
  }

}



class DataSearch extends SearchDelegate<String> {
  final cities = [
    "ayam",
    "ayam2",
    "bebek",
    "cacing",
    "domba",
    "elang",
    "faaa",
    "gajah",
    "kuda",
    "jerapah",
    "macan",
    "harimau",
    "lumba",
    "keledai"
  ];
  final recentCities = ["cacing", "domba", "ayam"];

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for app bar
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar when search
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //show some result based on the selection
    return Center(
      child: Container(
        height: 100,
        width: 100,
        child: Card(
          color: Colors.redAccent,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when someone search for somethin
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
