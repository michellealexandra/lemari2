part of 'pages.dart';

class CardLemari extends StatefulWidget {
  final Closets closets;
  CardLemari({this.closets});
  @override
  _CardLemariState createState() => _CardLemariState();
}

class _CardLemariState extends State<CardLemari> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Closets closet = widget.closets;
    if (closet == null) {
      return Container();
    } else {
      return GestureDetector(
          onTap: () {
            // Navigator.pushNamed(context, IsiLemari.routeName, arguments: closet);
            Navigator.pushNamed(context, GridClothes.routeName,
                arguments: closet);
          },
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: EdgeInsets.all(8),
            color: Color(0xffDBA878),
            child: ListTile(
              // leading: Container(
              //   width: size.width * 0.02,
              //   decoration: BoxDecoration(
              //       color: Color(0xffFFFFFF),
              //       borderRadius: BorderRadius.all(Radius.circular(8))),
              // ),
              title: Text(
                closet.closetName,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    color: Color(0xff5D4736)),
                maxLines: 1,
                softWrap: true,
              ),
              subtitle: Text(
                closet.closetDesc,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    fontFamily: GoogleFonts.openSans().fontFamily,
                    color: Color(0xffffffff)),
                maxLines: 2,
                softWrap: true,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.trash_fill,
                      color: Color(0xff5D4736),
                    ),
                    onPressed: () async {
                      bool result =
                          await ClosetsServices.deleteClosets(closet.closetId);
                      if (result) {
                        ActivityServices.showToast(
                          "Delete Data Success",
                        );
                      } else {
                        ActivityServices.showToast(
                          "Delete Data Success",
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ));
    }
  }
}

// Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                   child: Text(
//                     closet.closetName,
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         fontFamily: GoogleFonts.openSans().fontFamily,
//                         color: Color(0xff5D4736)),
//                     maxLines: 1,
//                     textAlign: TextAlign.center,
//                     softWrap: true,
//                   ),
//                   height: size.height * 0.05,
//                   width: size.width * 0.4,
//                   decoration: BoxDecoration(
//                       color: Color(0xffF0E8E1),
//                       borderRadius:
//                           BorderRadius.vertical(bottom: Radius.circular(14.0))),
//                 ),
//                 SizedBox(
//                   height: size.height * 0.05,
//                 ),
//                 Text(
//                   closet.closetDesc,
//                   style: TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.normal,
//                       fontFamily: GoogleFonts.openSans().fontFamily,
//                       color: Color(0xffffffff)),
//                   maxLines: 2,
//                   softWrap: true,
//                 )
//               ],
//             ),
