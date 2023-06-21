import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ecommerce/api/api_product.dart';
import 'package:ecommerce/components/product_card.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class MyProductsPage extends StatefulWidget {
  const MyProductsPage({super.key});


  @override
  State<MyProductsPage> createState() => _Products();
}

class _Products extends State<MyProductsPage> {
  ScrollController _scrollController = ScrollController();
  ApiProduct apiProduct = ApiProduct();
  List<Product> products = [];
  int categoryId = 1;
  int page = 0;
@override
  void initState() {
    getProducts();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  Future<void> getProducts() async {
    List<Product> newProducts = await apiProduct.getProductsByCategory(categoryId: categoryId, page:page);
    products.addAll(newProducts);
setState(() {

});}

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      page = page + 1;
      Future.delayed(Duration(milliseconds: 500), () async {
        await getProducts();
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

     // appBar: AppBar(title: Text("PRODUCTS"), ),
      body:products.length > 0?Column(
        children: [
          Expanded(
            child: GridView.builder(
              controller: _scrollController,
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                childAspectRatio: 0.5,
                mainAxisSpacing: 8,
              ),
              itemCount: products.length,

              itemBuilder: (context, index) {
                final product = products[index];
                return MyProductCard(id:products[index].id??0 ,authorName:products[index].authorName??"" ,
                  imageUrl:products[index].imageUrl??"" ,
                  price:products[index].price??0 ,
                  productName:products[index].productName??"",);
              },
            ),
          ),

        ],
      ):Center(
        child: Container(
            child: LoadingAnimationWidget.twistingDots(
             leftDotColor:  Colors.lightGreenAccent,
              rightDotColor: Colors.yellowAccent,
              size: 200,
            )),
      )


    );
  }
}