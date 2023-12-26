import 'dart:html';

import 'package:badges/badges.dart';
import 'package:booking/json/home_json.dart';
import 'package:booking/main.dart';
import 'package:booking/pages/book_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hello ,sopheamen ",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(profileimage, scale: 1),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Container(
              width: size.width * 0.8,
              height: 30,
              decoration: BoxDecoration(
                  color: grey.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Search...."),
                ),
              ),
            ),
            Flexible(
                child: IconButton(
                    onPressed: () {},
                    icon: Badge(
                      badgeColor: primary,
                      badgeContent: Text("3", style: TextStyle(color: white)),
                      child: Icon(LineIcons.shoppingBag, size: 25),
                    )))
          ],
        ),
        SizedBox(
          height: 15,
        ),
        getSectionQuote(),
        SizedBox(
          height: 30,
        ),
        getReadytodayselection(),
        SizedBox(
          height: 30,
        ),
        getSpecialforYou()
      ]),
    );
  }

  Widget getSectionQuote() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Quote of the day",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text(
                "I would rather here roses on the table than diamonds on the meck ",
                style: TextStyle(
                    fontSize: 15, height: 1.5, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "Emma gooldman",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getReadytodayselection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("ready Today",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        SizedBox(
          height: 15,
        ),
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(readytody, scale: 1), fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Top 10 books for self-development ",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15,
        ),
        Wrap(
          children: List.generate(tags.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                decoration: BoxDecoration(color: tags[index]["color"]),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: Text(
                    tags[index]["label"],
                    style: TextStyle(fontSize: 12, color: white),
                  ),
                ),
              ),
            );
          }),
        )
      ],
    );
  }

  Widget getSpecialforYou() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Specail for you ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            Row(
              children: [
                Text(
                  "see all",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(5, (index) {
              return GestureDetector(
                 onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(_)=>BookDetailPage(
                    img: specialForYouJson[index]['img'],
                    title:  specialForYouJson[index]['title'],
                    subTitle:  specialForYouJson[index]['sub_title'],
                    price:  specialForYouJson[index]['price'],
                    authorName:  specialForYouJson[index]['author_name'], 
                    rate:  specialForYouJson[index]['rate'].toString(), 
                    page:  specialForYouJson[index]['page']) ));
                 },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(12),
                            image: DecorationImage(  
                            image: NetworkImage(specialForYouJson[index]['img']),
                            fit:BoxFit.cover
                            )
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: black.withOpacity(0.2)
                            ),
                          ),
                          Positioned(
                            right:10,
                            top: 10,
                            child:Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: white,
                                shape: BoxShape.circle
                              ) ,
                              child:Icon(specialForYouJson[index]['favourite']?LineIcons.heartAlt:LineIcons.heart,
                              size: 20,color:danger ,))),
                              Positioned(child: Container(
                                width: 65,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius:BorderRadius.only(
                                    bottomRight:Radius.circular(12),
                                    topRight: Radius.circular(12) 
                                  ) 
                                ),
                                child: Center(
                                  child: Text(specialForYouJson[index]['price'],
                                   style:TextStyle(
                                    fontSize: 14,
                                    color: white,
                                    fontWeight: FontWeight.w600
                                    
                                  )
              
                                  ),
                                 
                                ),
              
                              ))
              
                              
              
              
                        ],
                      ),
                      SizedBox(height:10 ),
                      Container(
                      width: 120,
                     child: Text(specialForYouJson[index]['title'],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                      ),
                      )),
                      SizedBox(height: 5,),
                      Container(
                        width:120,
                        child: Text(specialForYouJson[index]['sub_title'],
                        maxLines: 1,
                        style:TextStyle(
                          fontSize: 13,
                          color:black.withOpacity(0.4)
                        )
              
                        ),
                      ),
                      SizedBox(height: 6.1,),
                      Container(
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                            ignoreGestures: true,
                            initialRating: specialForYouJson[index]['rate'],
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 14,
                            itemPadding: EdgeInsets.only(right: 2),
              
                           
                            itemBuilder: (context,_)=>Icon(Icons.star,color:danger), 
                            onRatingUpdate:(rating){ 
              
                            } ),
                            Text("(${specialForYouJson[index]['rare'].toString()})",
                            style: TextStyle(
                              fontSize: 13,
                              color:danger,
                              fontWeight: FontWeight.w500
                            ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
