part of 'dashboard.dart';

class RecentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Recent Items",
            style: TextStyle(
                fontSize: 18,
                fontFamily: GoogleFonts.openSans().fontFamily,
                fontWeight: FontWeight.w900,
                color: Color(0xff5D4736)),
            textAlign: TextAlign.right,
          ),
          GestureDetector(
            onTap: () {
              //tombol back hilang, klo push named ada back button
              // Navigator.pushReplacementNamed(
              //     context, Lemari.routeName);
            },
            child: Text("See all",
                style: TextStyle(color: Colors.red[700], fontSize: 16)),
          )
        ],
      ),
    );
  }
}
