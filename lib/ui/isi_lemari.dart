part of 'pages.dart';

class IsiLemari extends StatefulWidget {
  // final Closets closets;
  static const String routeName = "/isilemari";

  @override
  _IsiLemariState createState() => _IsiLemariState();
}

class _IsiLemariState extends State<IsiLemari> {
  @override
  Widget build(BuildContext context) {
    Closets closet = ModalRoute.of(context).settings.arguments;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Lemari A",
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
        body: ListView(scrollDirection: Axis.vertical, children: [
          Container(
            width: size.width,
            height: size.height,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Categories(),
                Expanded(child: GridViewClothes())
              ],
            ),
          )
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddClothes.routeName, arguments: closet);
          },
          child: const Icon(Icons.add),
          backgroundColor: Color(0xffFFEFDF),
          foregroundColor: Color(0xff5D4736),
        ));
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
//         height: 25,
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

// class DataDummy extends SearchDelegate<String> {
//   final cities = [
//     "ayam",
//     "ayam2",
//     "bebek",
//     "cacing",
//     "domba",
//     "elang",
//     "faaa",
//     "gajah",
//     "kuda",
//     "jerapah",
//     "macan",
//     "harimau",
//     "lumba",
//     "keledai"
//   ];
//   final recentCities = ["cacing", "domba", "ayam"];

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     //actions for app bar
//     return [
//       IconButton(
//           onPressed: () {
//             query = "";
//           },
//           icon: Icon(Icons.clear))
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     //leading icon on the left of the app bar when search
//     return IconButton(
//       icon: AnimatedIcon(
//           icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     //show some result based on the selection
//     return Center(
//       child: Container(
//         height: 100,
//         width: 100,
//         child: Card(
//           color: Colors.redAccent,
//           child: Center(
//             child: Text(query),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     //show when someone search for somethin
//     final suggestionList = query.isEmpty
//         ? recentCities
//         : cities.where((p) => p.startsWith(query)).toList();

//     return ListView.builder(
//       itemBuilder: (context, index) => ListTile(
//         onTap: () {
//           showResults(context);
//         },
//         leading: Icon(Icons.location_city),
//         title: RichText(
//           text: TextSpan(
//               text: suggestionList[index].substring(0, query.length),
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//               children: [
//                 TextSpan(
//                     text: suggestionList[index].substring(query.length),
//                     style: TextStyle(color: Colors.grey))
//               ]),
//         ),
//       ),
//       itemCount: suggestionList.length,
//     );
//   }
// }
