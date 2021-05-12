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
        ),
        resizeToAvoidBottomInset: false,
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, int index) {
            final item = items[index];
            return new Dismissible(
              key: new Key(items[index]),
              onDismissed: (direction) {
                items.removeAt(index);
                // ignore: deprecated_member_use
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text("item dismissed"),
                ));
              },
              background: new Container(color: Colors.red),
              child: new ListTile(
                title: new Text("${items[index]}"),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddCloset.routeName);
          },
          child: const Icon(Icons.add),
          backgroundColor: Color(0xffFFEFDF),
          foregroundColor: Color(0xff5D4736),
        ));
  }
}
