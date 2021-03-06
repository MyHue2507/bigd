import 'package:bigdeals2/tabs/tabs.dart';
import 'package:bigdeals2/app_bloc.dart';

class ProductsOfCategories extends StatefulWidget {
  FetchCategory category = FetchCategory() ;
  AppBloc appBloc ;
  String name_categories;
  int id_categories;
  ProductsOfCategories(
      {Key key, this.name_categories, this.id_categories,this.appBloc})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductsOfCategoriesState();
  }
}

class _ProductsOfCategoriesState extends State<ProductsOfCategories> {
  @override
  void initState() {
    super.initState();
    _fetchProductsOfCategories();
  }

  List<ProductsItem> products = List();
  _fetchProductsOfCategories() async {
    var product =
          await widget.category.fetchProductsOfCategories(widget.id_categories);
      setState(() {
        products.addAll(product);
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(150, 7, 239, 204),
          title: Text(widget.name_categories),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                ModelProductsItem(product: products[index],appBloc: widget.appBloc,),
            itemCount: products?.length ?? 0,
          ),
        ));
  }
}
