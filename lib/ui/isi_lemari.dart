part of 'pages.dart';

class IsiLemari extends StatefulWidget {
  static const String routeName = "/isilemari";
  @override
  _IsiLemariState createState() => _IsiLemariState();
}

class _IsiLemariState extends State<IsiLemari> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Lemari A",
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
            width: size.width,
            height: size.height,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Michelle Alexandra Dinata",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: GoogleFonts.lato().fontFamily,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff5D4736)),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * 0.1,
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "Search",
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.redAccent),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                    ),
                  ],
                ),
                Categories(),
                SizedBox(
                  height: size.height * 0.04,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
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
  List<String> categories = ["Top", "Bottom", "Dress", "Outer", "Accessories"];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 25,
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedindex == index ? Color(0xff5D4736) : Color(0xffE4E0DC),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20 / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedindex == index ? Color(0xff5D4736) : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}