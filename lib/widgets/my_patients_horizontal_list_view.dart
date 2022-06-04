// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyPatientsHorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 110.0,
        color: Colors.transparent,
        child: ListView.builder(
          // padding: EdgeInsets.only(left: Regular_margin_size),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                  color: Color.fromRGBO(
                    26,
                    105,
                    200,
                    1.0,
                  ),
                ),
                // height: 115.0,
                width: 250.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22.0, 15.0, 22.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Office No.248/3 patients",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 8.0,
                            ),
                            child: Icon(
                              Icons.access_time,
                              color: Colors.white,
                              size: 15.0,
                            ),
                          ),
                          Text(
                            "8:30 AM - 02:00 PM",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 28.0,
                            child: ListView.builder(
                              itemCount: 3,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    right: 8.0,
                                  ),
                                  child: CircleAvatar(
                                    radius: 12.0,
                                    backgroundImage: NetworkImage(
                                        "https://avatoon.me/wp-content/uploads/2020/07/Cartoon-Pic-Ideas-for-DP-Profile07.png"),
                                  ),
                                );
                              },
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 22.0,
                            width: 24.0,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(
                                91,
                                158,
                                249,
                                1.0,
                              ),
                              borderRadius: BorderRadius.circular(11.0),
                            ),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 22,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
