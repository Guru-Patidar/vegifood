import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget singleProduct() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 35.h,
      width: 45.w,
      decoration: BoxDecoration(
          color: Color(0xffd9dad9), borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network("https://pngimg.com/d/spinach_PNG18.png"),
            flex: 2,
          ),
          Expanded(
            flex: 1,
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fresh Basil',
                  style: TextStyle(
                    fontSize: 4.w,
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  '50\$/50 Gram',
                  style: TextStyle(
                    fontSize: 3.5.w,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      width: 20.w,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            '50 Gram',
                            style: TextStyle(fontSize: 2.7.w),
                          )),
                          Center(
                            child: Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                              color: Color(0xffd0b84c),
                            ),
                          )
                        ],
                      ),
                    )),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Container(
                      width: 20.w,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.remove,
                              size: 15,
                              color: Color(0xffd0b84c),
                            ),
                            Text(
                              '1',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffd0b84c)),
                            ),
                            Icon(
                              Icons.add,
                              size: 15,
                              color: Color(0xffd0b84c),
                            ),
                          ]),
                    )),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcbcbcb),
      drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Color(0xffd4d181),
            child: Icon(
              Icons.search,
              size: 17,
              color: Colors.black,
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: CircleAvatar(
                radius: 14,
                backgroundColor: Color(0xffd4d181),
                child: Icon(
                  Icons.shop_outlined,
                  size: 17,
                  color: Colors.black,
                ),
              ))
        ],
        backgroundColor: Color(0xffd6b738),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            children: [
              Container(
                height: 22.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://www.foodiesfeed.com/wp-content/uploads/2023/07/healthy-foods.jpg'),
                        fit: BoxFit.fill),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Expanded(
                        child: Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 8.h,
                              width: 12.h,
                              decoration: BoxDecoration(
                                  color: Color(0xffd1ad17),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(50),
                                      bottomLeft: Radius.circular(50))),
                              child: Center(
                                child: Text(
                                  'Vegi',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      shadows: [
                                        BoxShadow(
                                            color: Colors.green,
                                            blurRadius: 10,
                                            offset: Offset(3, 3))
                                      ]),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '30% Off',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.w,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'On all vegetables products',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 3.5.w,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Herbs Seasonings",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'view all',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      )
                    ]),
              ),
              SingleChildScrollView(
                reverse: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    singleProduct(),
                    singleProduct(),
                    singleProduct(),
                    singleProduct(),
                    singleProduct(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fresh Foods ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'view all',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      )
                    ]),
              ),
              SingleChildScrollView(
                reverse: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    singleProduct(),
                    singleProduct(),
                    singleProduct(),
                    singleProduct(),
                    singleProduct(),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
