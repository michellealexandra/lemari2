part of 'dashboard.dart';

class WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // SizedBox(
          //   width: MediaQuery.of(context).size.height * 0.12,
          // ),
          //photo
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.15,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.15,
                    top: 36,
                    right: MediaQuery.of(context).size.width * 0.05),
                padding: EdgeInsets.all(20.0),
                child: Text("photo"),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.redAccent),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
            ],
          ),
          //text welcome dan name
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    fontWeight: FontWeight.w200,
                    color: Color(0xff8B827B)),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                "Michelle Alexandra",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: GoogleFonts.openSans().fontFamily,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5D4736),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
