import 'package:bigdeals2/tabs/tabs.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bigdeals2/app_bloc.dart';

class ListCategory extends StatefulWidget {
  AppBloc appBloc ;
  CategaryItem categary;
  ListCategory({Key key ,this.categary ,this.appBloc}):super(key : key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListCategoryState();
  }
}

class ListCategoryState extends State<ListCategory> {
  _builCategoryItem() {
    return Container(
      padding: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 5.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(
                  widget.categary.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              MaterialButton(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'View more >',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w200),
                      ),
                    ]),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewMore(categaryItem: widget.categary,appBloc: widget.appBloc,)));
                },
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: Card(
              child: InkWell(
                onTap: () async {
                  if (await canLaunch(widget.categary.ads_url)) {
                    launch(widget.categary.ads_url);
                  }
                },
                child: Image.network(
                  widget.categary.ads_banner,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _builCategoryItem();
  }
}
