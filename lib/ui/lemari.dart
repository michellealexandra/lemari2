part of 'pages.dart';

class Lemari extends StatefulWidget {
  static const String routeName = "/lemari";

  @override
  _LemariState createState() => _LemariState();
}

class _LemariState extends State<Lemari> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    int _selectedItem = 0;

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
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // ignore: deprecated_member_use
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storage),
            // ignore: deprecated_member_use
            title: Text('Lemari'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            // ignore: deprecated_member_use
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedItem,
        onTap: (index) {
          setState(() {
            _selectedItem = 2;
          });
        },
      ),
    );
  }
}
