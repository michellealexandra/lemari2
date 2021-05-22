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
    Closets closet = widget.closets;
    if (closet == null) {
      return Container();
    } else {
      return GestureDetector(
          onTap: () {
            //tombol back hilang pushReplacementNamed, klo push named ada back button
            Navigator.pushNamed(context, IsiLemari.routeName);
          },
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: EdgeInsets.all(8),
            color: Color(0xffDBA878),
            child: Container(
              padding: EdgeInsets.all(8),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 24.0,
                  backgroundImage: NetworkImage(closet.closetImage),
                ),
                title: Text(
                  closet.closetName,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  softWrap: true,
                ),
                subtitle: Text(
                  closet.closetDesc,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                  maxLines: 1,
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
                        bool result = await ClosetsServices.deleteClosets(
                            closet.closetId);
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
            ),
          ));
    }
  }
}
