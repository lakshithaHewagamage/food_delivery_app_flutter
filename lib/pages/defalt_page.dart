import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/consts.dart';
import 'package:food_delivery_app/core/flutter_icons.dart';
import 'package:food_delivery_app/models/food_model.dart';

class DetailPage extends StatefulWidget
{
  final FoodModel data;
  DetailPage(this.data);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
{
  @override 
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: AppColors.greenColor,
      body: Column(
        children: <Widget>[
           const SizedBox(height:50),
          _customAppBar(),
          Container(
            height: 270,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                const Image(
                  image: AssetImage("assets/bg.png"),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: "image${widget.data.imgPath}",
                    child: Image(
                      image: AssetImage("assets/${widget.data.imgPath}"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.all(28),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.data.name,
                    style:const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        "\$${widget.data.price.toInt()}",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.redColor,
                        ),
                      ),
                      const SizedBox(height: 30),
                      _buildCounter(),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildInfo("Weight","${widget.data.weight.toInt()}gm"),
                      _buildInfo("Calories","${widget.data.calory.toInt()}ccal"),
                      _buildInfo("Protein","${widget.data.protein.toInt()}gm"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Items",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.redColor,
                    ),
                  ),
                  const SizedBox(height:8),
                  Text(widget.data.item),
                  const Expanded(child: SizedBox()),
                  Row(
                    children:<Widget> [
                      Expanded(
                        child: RaisedButton(
                          onPressed: (){},
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          color: AppColors.greenColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            )
                          ),
                          child: const Text(
                            "Add to Cart",
                            style: TextStyle(
                              fontSize: 28,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(String title,String val) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          val,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.redColor,
          ),
        ),
      ],
    );
  }
  
  Widget _customAppBar() 
  {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: const Icon(
                FlutterIcons.left,
                size: 16,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: const Icon(
              FlutterIcons.shop,
              size: 12,
            ),
          ),
        ],
      ),
    );
  }
  
   Widget _buildCounter() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.remove,
              color: Colors.black,
            ),
            onPressed: null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "1",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: null,
          ),
        ],
      ),
    );
  }

}