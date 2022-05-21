import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app/core/consts.dart';
import 'package:food_delivery_app/core/flutter_icons.dart';
import 'package:food_delivery_app/models/food_model.dart';
import 'dart:math' as math;

import '../widgets/app_clipper.dart';
import 'defalt_page.dart';

class HomePage extends StatefulWidget 
{
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  List<FoodModel> foodList = FoodModel.list;
  PageController pageController = PageController(viewportFraction: .8);
  var paddingLeft =0.0;

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 60
                ),
              child: _buildRightSection(),
            ),
            Container(
              color: AppColors.greenColor,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(top: 45),
              width: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(top: 16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      image: DecorationImage(
                        image: ExactAssetImage("assets/profile.jpg"),
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Icon(FlutterIcons.menu),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Transform.rotate(
                angle: -math.pi/2,
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Row(
                      children: <Widget>[
                        _buildMenu("Vegetables",0),
                        _buildMenu("Chicken",1),
                        _buildMenu("Beef",2),
                        _buildMenu("Thai",3),
                      ],
                    ),
                    AnimatedContainer(
                      duration:Duration(milliseconds: 250),
                      margin: EdgeInsets.only(left: paddingLeft),
                      width: 150,
                      height: 75,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ClipPath(
                              clipper:  AppClipper(),
                              child: Container(
                                width: 150,
                                height: 60,
                                color: AppColors.greenColor,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Transform.rotate(
                              angle: math.pi/2,
                              child: const Padding(
                                padding: EdgeInsets.only(right: 40),
                                child: Icon(
                                  FlutterIcons.arrow,
                                  size: 16,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenu(String menu, int index ) 
  {
    return GestureDetector(
      onTap:()  
      {
        setState(() {
          paddingLeft = index * 150.0;
        });
      },
      child: Container(
        width: 150,
        padding: const EdgeInsets.only(top: 16),
        child:  Center(
          child: Text(
            menu,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRightSection() {
    return Padding(
      padding: const EdgeInsets.only(top:50),
      child: Column(
        children: <Widget>[
          _customAppBar(),
          Expanded(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 350,
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: foodList.length,
                    controller: pageController,
                    itemBuilder: (context, index)
                    {
                      return GestureDetector(
                         onTap: () {
                           Navigator.of(context).push(
                             MaterialPageRoute(
                               builder: (_) => DetailPage(foodList[index]),
                            ),
                           );
                         },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Stack(
                            children: <Widget> [
                              _buildBackGround(index),
                              Align(
                                alignment: Alignment.topRight,
                                child:Transform.rotate(
                                  angle: math.pi/3,
                                  child: Hero(
                                    tag: "image${foodList[index].imgPath}",
                                    child: Image(
                                      width: 180,
                                      image: AssetImage(
                                        "assets/${foodList[index].imgPath}"),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 20,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.redColor,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical:8,
                                    horizontal: 16
                                  ),
                                  child: Text(
                                    "\$${foodList[index].price.toInt()}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    "Popular",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
                _buildPopularList(),
              ],
            )
          ),
        ],
      )
    );
  }

  Container _buildBackGround(int index) {
    return Container(
                              margin: const EdgeInsets.only(
                                top: 50,
                                bottom: 20,
                                right: 40,
                              ),
                              padding: const EdgeInsets.all(28),
                              decoration: BoxDecoration(
                                color: AppColors.greenColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(32),
                                ),
                              ),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Expanded(child: SizedBox()),
                                  Row(
                                    children: <Widget>[
                                      RatingBar.builder(
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 12,
                                        unratedColor: Colors.black12,
                                        itemPadding: 
                                        const EdgeInsets.symmetric(horizontal: 1.0),
                                        itemBuilder: (constext, _) => const Icon(
                                          Icons.star,
                                          color: Colors.black,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                      const SizedBox(width: 10),
                                      const Text(
                                        "(120 Reviews)",
                                        style: TextStyle(
                                        fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    foodList[index].name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            );
  }

  Widget _buildPopularList()
  {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: foodList.length,
      padding: const EdgeInsets.only(
        left: 32,
        bottom: 12,
        top: 20
      ),
      itemBuilder: (context, index){
        return Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(
            bottom: 16),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.2),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            )
          ),
          child: Row(
            children: <Widget>[
              Image(
                width: 100,
                image:AssetImage(
                  "assets/${foodList[index].imgPath}"
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    foodList[index].name,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: <Widget>[
                      Text(
                        "\$${foodList[index].price.toInt()}",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.redColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "${foodList[index].weight.toInt()}gm Weight",
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      }
    );
  }

  Widget _customAppBar()
  {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          RichText(
              text: TextSpan(
                text:"Hello,\n",
                style: const TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: "Lakshitha Sheshan",
                    style :TextStyle(
                      color: AppColors.greenColor,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  )
                ]
              ),
            ),
            const SizedBox(width: 16,),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.greenLightColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color:AppColors.greenLightColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                      ),
                    ),
                  child: Row(
                    children: const <Widget>[
                      Expanded(
                        child: TextField(
                        decoration:InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        ),
                      ),
                    ),
                    Icon(
                      FlutterIcons.search,
                      size: 16,
                      ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.all(
              Radius.circular(12),
              ),
            ),
            child: const Center(
              child: Icon(
                FlutterIcons.shop,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}