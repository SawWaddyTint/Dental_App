// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:dental_app/bloc/home_bloc.dart';
import 'package:dental_app/components/smart_list_view.dart';
import 'package:dental_app/data/vos/time_vo.dart';
import 'package:dental_app/pages/details_page.dart';
import 'package:dental_app/widgets/my_patients_horizontal_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _loading = true;
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeBloc(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Column(
                children: [GradientView(), BottomBackgroundView()],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  30.0,
                  60.0,
                  0.0,
                  0,
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      SearchBarAndProfileAvatarView(),
                      SizedBox(
                        height: 35.0,
                      ),
                      PatientCountView()
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 350,
                left: 0,
                height: 2000.0,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TimeAndEventsTitleView(),
                      TimeListAndEventsListView(
                          () => _navigateToDetailsScreen(context)),
                      LoadingView(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  30.0,
                  0,
                  0,
                  110.0,
                ),
                child: MyPatientsHorizontalListView(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBackgroundView extends StatelessWidget {
  const BottomBackgroundView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color.fromRGBO(245, 248, 255, 1.0),
      ),
    );
  }
}

class GradientView extends StatelessWidget {
  const GradientView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.4,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(6.0),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(28, 89, 178, 1.0),
            Color.fromRGBO(19, 79, 159, 1.0)
          ],
        ),
      ),
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HomeBloc, bool>(
        selector: (context, bloc) => bloc.loading,
        builder: (BuildContext context, loading, child) {
          return Container(
            color: Color.fromRGBO(
              221,
              231,
              249,
              0.8,
            ),
            child: Visibility(
              visible: loading,
              child: SpinKitFadingCircle(
                // itemBuilder: (BuildContext context, int index) {
                //   return DecoratedBox(
                //     decoration: BoxDecoration(
                //       color: Colors.blue,
                //     ),
                //   );
                // },
                size: 38.0,
                color: Colors.blue,
              ),
            ),
          );
        });
  }
}

class TimeListAndEventsListView extends StatelessWidget {
  final Function goToDetail;
  TimeListAndEventsListView(this.goToDetail);

  @override
  Widget build(BuildContext context) {
    return Selector<HomeBloc, List<TimeVO>?>(
      selector: (context, bloc) => bloc.timeData1,
      shouldRebuild: (previous, next) => true,
      builder: (BuildContext context, timeData1, child) {
        return Selector<HomeBloc, bool>(
          selector: (context, bloc) => bloc.loading,
          shouldRebuild: (previous, next) => true,
          builder: (BuildContext context, loading, child) {
            return Container(
              height: loading ? 180.0 : 270.0,
              child: SmartHorizontalListView(
                itemCount: timeData1?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 30.0,
                        ),
                        SizedBox(
                          width: 50.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                timeData1?[index].startTime ?? "",
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Text(
                                timeData1?[index].endTime ?? "",
                              ),
                              SizedBox(
                                height: 35.0,
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(width: 10.0),
                        Flexible(
                          child: Container(
                            height: 115,
                            width: 280,
                            color: Color.fromRGBO(245, 248, 255, 1.0),

                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 120.0),
                                  child: (timeData1 != null &&
                                          timeData1[index].isCurrentTime)
                                      ? DrawLine(60.0)
                                      : DrawDottedLine(110),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 9),
                                  child: Container(
                                    height: 115,
                                    width: 280,
                                    color: (timeData1 != null &&
                                            timeData1[index].isCurrentTime)
                                        ? Color.fromRGBO(221, 231, 249, 0.8)
                                        : Color.fromRGBO(245, 248, 255, 1.0),
                                  ),
                                ),
                                (timeData1 != null &&
                                        timeData1[index].showCircle)
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 100.0),
                                        child: Align(
                                          // padding: const EdgeInsets.only(
                                          //     right: 250.0),
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            height: 16.0,
                                            width: 16.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  spreadRadius: 2,
                                                  blurRadius: 2,
                                                  offset: Offset(0,
                                                      1), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Container(
                                                height: 10.0,
                                                width: 10.0,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      19, 79, 159, 1.0),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        color: Colors.transparent,
                                        height: 16.0,
                                        width: 16.0,
                                      ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      25.0, 8.0, 0, 0),
                                  child: Container(
                                    height: 70.0,
                                    width: 230,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        IconView(),
                                        SizedBox(
                                          width: 14.0,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            PatientNameView(),
                                            Row(children: [
                                              TimeIconView(),
                                              Text(
                                                " ${timeData1?[index].startTime} AM - ${timeData1?[index].endTime} PM",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        191, 193, 196, 1.0),
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ])
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // width: ,
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      goToDetail();
                    },
                  );
                },
                pullToRefreshList: () async {
                  await Future.delayed(Duration(seconds: 2));
                  var scaffold = ScaffoldMessenger.of(context);
                  scaffold.showSnackBar(
                    SnackBar(
                      content: const Text(
                        'Refreshing Data Complete',
                      ),
                      //   action: SnackBarAction(
                      //        label: 'UNDO',
                      //       onPressed:
                      //           scaffold.hideCurrentSnackBar),
                    ),
                  );
                },
                onListEndReached: () async {
                  var bloc = Provider.of<HomeBloc>(context, listen: false);
                  bloc.showLoading();
                  await Future.delayed(const Duration(seconds: 2), () {
                    bloc.notShowLoading();
                    var scaffold = ScaffoldMessenger.of(context);
                    scaffold.showSnackBar(
                      SnackBar(
                        content: const Text(
                          'No More Data',
                        ),
                        //   action: SnackBarAction(
                        //        label: 'UNDO',
                        //       onPressed:
                        //           scaffold.hideCurrentSnackBar),
                      ),
                    );
                  });
                },
              ),
            );
          },
        );
      },
    );
  }
}

class TimeIconView extends StatelessWidget {
  const TimeIconView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
      ),
      child: Icon(
        Icons.access_time,
        color: Color.fromRGBO(191, 193, 196, 1.0),
        size: 15.0,
      ),
    );
  }
}

class PatientNameView extends StatelessWidget {
  const PatientNameView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Francisco Eillot",
        style: TextStyle(
            color: Color.fromRGBO(107, 111, 114, 1.0),
            fontWeight: FontWeight.bold));
  }
}

class IconView extends StatelessWidget {
  const IconView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0,
      width: 36.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(221, 231, 249, 0.8),
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Icon(
        Icons.medication,
        size: 20,
        color: Color.fromRGBO(65, 128, 185, 1.0),
      ),
    );
  }
}

class TimeAndEventsTitleView extends StatelessWidget {
  const TimeAndEventsTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 28.0,
        ),
        SizedBox(
          width: 52.0,
          child: Text(
            "Time",
            style: TextStyle(
              color: Color.fromRGBO(
                96,
                99,
                104,
                1.0,
              ),
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 50.0),
        // DrawDottedLine(60.0),
        // SizedBox(
        //   width: 20.0,
        // ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            "Events",
            style: TextStyle(
              color: Color.fromRGBO(
                96,
                99,
                104,
                1.0,
              ),
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class PatientCountView extends StatelessWidget {
  const PatientCountView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Patients",
              style: TextStyle(
                color: Colors.white, fontSize: 16.0,
                // fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "12 total",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 10.0,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 120.0,
        ),
        Container(
          height: 35,
          width: 75,
          decoration: BoxDecoration(
            color: Color.fromRGBO(
              62,
              135,
              247,
              1.0,
            ),
            borderRadius: BorderRadius.circular(
              6.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Today",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 20.0,
              )
            ],
          ),
        )
      ],
    );
  }
}

class SearchBarAndProfileAvatarView extends StatelessWidget {
  const SearchBarAndProfileAvatarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 45.0,
          width: 230.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              25.0,
            ),
            color: Color.fromRGBO(
              36,
              104,
              201,
              1.0,
            ),
            // color: Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  "Search",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12.0,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.search,
                  color: Colors.white70,
                  size: 20.0,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: CircleAvatar(
            radius: 22.0,
            backgroundImage: NetworkImage(
                "https://avatoon.me/wp-content/uploads/2020/07/Cartoon-Pic-Ideas-for-DP-Profile07.png"),
          ),
        ),
      ],
    );
  }
}

void _navigateToDetailsScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailsPage(),
    ),
  );
}

class DrawDottedLine extends StatelessWidget {
  final double height;
  DrawDottedLine(this.height);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Change to your preferred size.
      // Width and height will be used under "paint" method below.
      // The canvas accesses it by using size.width, size.height
      height: height,
      width: 0,
      child: CustomPaint(
        painter: DottedLinePainter(),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 4.5, dashSpace = 5, startY = 0.5;
    final paint = Paint()
      ..color = Color.fromRGBO(
        96,
        99,
        104,
        1.0,
      )
      ..strokeWidth = 1.8;
    while (startY < size.height) {
      canvas.drawLine(
          Offset(8.2, startY), Offset(8.2, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DrawLine extends StatelessWidget {
  final double height;
  DrawLine(this.height);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: 0,
      child: CustomPaint(
        painter: LinePainter(),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromRGBO(
        96,
        99,
        104,
        1.0,
      )
      ..strokeWidth = 0.7;
    final p1 = Offset(8.2, -4);
    final p2 = Offset(8.2, 150);
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
