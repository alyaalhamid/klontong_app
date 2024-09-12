import 'package:flutter/material.dart';
import 'package:klontong_app/APIKLONTONG.dart';
import 'package:klontong_app/ApiKlontongService.dart';
import 'package:klontong_app/ItemWidget.dart';
import 'package:klontong_app/detail.dart';

class branda extends StatefulWidget {
  @override
  State<branda> createState() => _brandaState();
}

class _brandaState extends State<branda> {
  List items = [
    'klontong_app/assets/ciki1.jpg',
    'klontong_app/assets/ciki1.jpg',
    'klontong_app/assets/ciki1.jpg',
    'klontong_app/assets/ciki1.jpg',
    'klontong_app/assets/ciki1.jpg',
  ];

  var itemklontong;
  @override
  void initState() {
    itemklontong = ApiKlontongService().getklontong();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SHOPPING KLONTONG',
                style: TextStyle(color: Color(0xFF461797), fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Color(0xFFDBD8D8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ALL ITEMS',
                        style:
                            TextStyle(color: Color(0xFF461797), fontSize: 24),
                      ),
                      FutureBuilder<List<klontong>?>(
                          future: itemklontong,
                          builder: (BuildContext context,
                              AsyncSnapshot<List<klontong>?> snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                    'there is something wrong : ${snapshot.error}'),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.data != null) {
                                //klontong dataklontong = klontong();
                                return SizedBox(
                                    child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.68,
                                        ),
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          klontong dataklontong = (snapshot.data
                                              as List<klontong>)[index];
                                          return Container(
                                            padding: EdgeInsets.only(
                                                left: 15, right: 15, top: 15),
                                            margin: EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 10),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            detailklontong(
                                                              id: dataklontong
                                                                      .idstring
                                                                  as String,
                                                            )));
                                              },
                                              child: Column(
                                                children: [
                                                  Image.network(
                                                    dataklontong.image
                                                        .toString(),
                                                    width: 150,
                                                    height: 150,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Container(
                                                    color: Colors.purple,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text('DESCRIPTION'),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        })
                                    // ListView.builder(
                                    //     itemCount: snapshot.data!.length,
                                    //     itemBuilder: (context, index) {
                                    //       klontong dataklontong = (snapshot.data
                                    //           as List<klontong>)[index];
                                    //       return Column(
                                    //         children: [
                                    //           ItemWidget(
                                    //               image:
                                    //                   dataklontong.image as String,
                                    //               press: () {})
                                    //         ],
                                    //       );
                                    //     }),
                                    );
                                // return Column(
                                //   children: [
                                //     ItemWidget(
                                //       image: dataklontong.image as String,
                                //       press: () {},
                                //     )
                                //   ],
                                // );
                              } else {
                                return Text('No data');
                              }
                            } else {
                              return CircularProgressIndicator();
                            }
                          })
                      //ItemWidget()
                      // Expanded(
                      //   child: GridView.builder(
                      //     gridDelegate:
                      //         SliverGridDelegateWithFixedCrossAxisCount(
                      //       crossAxisCount: 2,
                      //       mainAxisSpacing: 8,
                      //       crossAxisSpacing: 8,
                      //     ),
                      //     padding: EdgeInsets.all(8),
                      //     itemCount: items.length,
                      //     itemBuilder: (context, index) {
                      //       return Container(
                      //         color: Colors.blue,
                      //         child: Center(
                      //           child: Text(
                      //             items[index],
                      //             style: TextStyle(
                      //                 fontSize: 18, color: Colors.white),
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
