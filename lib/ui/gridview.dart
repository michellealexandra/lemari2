part of 'pages.dart';

class GridViewClothes extends StatefulWidget {
  @override
  _GridViewClothesState createState() => _GridViewClothesState();
}

class _GridViewClothesState extends State<GridViewClothes> {
  List<Container> daftarSuperhero = new List();

  var karakter = [
    {"nama": "Aquaman", "gambar": "aquaman.jpg"},
    {"nama": "Batman", "gambar": "batman.jpg"},
    {"nama": "Captain Amerika", "gambar": "captain.jpg"},
    {"nama": "Catwoman", "gambar": "catwoman.jpg"},
    {"nama": "Flash", "gambar": "flash.jpg"},
    {"nama": "Hulk", "gambar": "hulk.jpg"},
    {"nama": "Ironman", "gambar": "ironman.jpg"},
    {"nama": "Spiderman", "gambar": "spiderman.jpg"},
    {"nama": "Venom", "gambar": "venom.jpg"},
    {"nama": "Superman", "gambar": "superman.jpg"},
  ];

  _buatlist() async {
    for (var i = 0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      final String gambar = karakternya["gambar"];

      daftarSuperhero.add(Container(child: CardClothesLemari()));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new GridView.count(
        crossAxisCount: 2,
        // children: daftarSuperhero,
        
        children: [
          CardClothesLemari()
        ],
      ),
    );
  }
}
