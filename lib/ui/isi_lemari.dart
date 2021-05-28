part of 'pages.dart';

class IsiLemari extends StatefulWidget {
  // final Closets closets;
  static const String routeName = "/isilemari";
  final Clothes clothes;
  IsiLemari({this.clothes});

  @override
  _IsiLemariState createState() => _IsiLemariState();
}

class _IsiLemariState extends State<IsiLemari> {
  CollectionReference clothesCollection =
      FirebaseFirestore.instance.collection("clothes");
  @override
  Widget build(BuildContext context) {
    Closets closet = ModalRoute.of(context).settings.arguments;
    Clothes baju = widget.clothes;
    return Scaffold(
        appBar: AppBar(
          title: Text("Lemari A",
              // closet.closetName,
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
                  showSearch(context: context, delegate: DataDummy());
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
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff564B46)),
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.clip,
                    softWrap: false,
                  )
                ],
              ),
            ),
            Categories(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    // padding: EdgeInsets.only(right: 15.0),
                    width: MediaQuery.of(context).size.width - 30.0,
                    height: MediaQuery.of(context).size.height - 50.0,
                    child: GridView.count(
                      crossAxisCount: 2,
                      primary: false,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 15.0,
                      childAspectRatio: 0.8,
                      children: <Widget>[
                        _buildCard('Dummy'),
                        _buildCard('Dummy1'),
                        _buildCard('Dummy2'),
                        _buildCard('Dummy3'),
                      ],
                    )),
              ],
            ),
            SizedBox(height: 15.0)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddClothes.routeName,
                arguments: closet);
          },
          child: const Icon(Icons.add),
          backgroundColor: Color(0xffFFEFDF),
          foregroundColor: Color(0xff5D4736),
        ));
  }

  Widget _buildCard(String name) {
    Clothes baju = widget.clothes;
    final Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              // Navigator.pushNamed(context, DetailClothes.routeName);
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
                    padding: EdgeInsets.only(top: size.height * 0.04),
                  ),
                  Hero(
                    tag: 'assets/images/dummy.jpg',
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage("assets/images/dummy.jpg"),
                    ),
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffF0E8E1)),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Container(color: Color(0xFFEBEBEB), height: 2.9657),
                  ),
                  Container(
                    color: Color(0xffF0E8E1),
                    child: Row(
                        //logo"nya
                        children: [
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(14.0)),
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/icons/Mesin.png"))),
                            width: size.width * 0.07,
                            height: size.height * 0.07,
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/icons/Dress.png"))),
                            width: size.width * 0.07,
                            height: size.height * 0.07,
                          ),
                        ]),
                  )
                ]))));
  }
}

// class Categories extends StatefulWidget {
//   @override
//   _CategoriesState createState() => _CategoriesState();
// }

// class _CategoriesState extends State<Categories> {
//   List<String> categories = ["Top", "Bottom", "Dress", "Outer", "Accessories"];
//   int selectedindex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 20),
//       child: SizedBox(
//         height: 30,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: categories.length,
//           itemBuilder: (context, index) => buildCategory(index),
//         ),
//       ),
//     );
//   }

//   Widget buildCategory(int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedindex = index;
//         });
//       },
//       child: Padding(
//         //antar word top bottom etc
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               categories[index],
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontFamily: GoogleFonts.openSans().fontFamily,
//                 fontSize: 14,
//                 color: selectedindex == index
//                     ? Color(0xff5D4736)
//                     : Color(0xffE4E0DC),
//               ),
//             ),
//             Container(
//               //antar word dan garis
//               margin: EdgeInsets.only(top: 20 / 4), //top padding 5
//               height: 2,
//               width: 30,
//               color: selectedindex == index
//                   ? Color(0xff5D4736)
//                   : Colors.transparent,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class DataDummy extends SearchDelegate<String> {
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
