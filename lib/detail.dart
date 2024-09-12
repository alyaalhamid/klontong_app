import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:klontong_app/APIKLONTONG.dart';
import 'package:klontong_app/ApiKlontongService.dart';
import 'package:klontong_app/ApiKlontongServiceDetail.dart';

class detailklontong extends StatefulWidget {
  detailklontong({super.key, required this.id});
  String id;

  @override
  State<detailklontong> createState() => _detailklontongState();
}

class _detailklontongState extends State<detailklontong> {
  var itemdetailklontong;
  klontong detailklontong = klontong();
  @override
  void initState() {
    itemdetailklontong = ApiKlontongDetail().getklontongDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<List<klontong>?>(
                    future: itemdetailklontong,
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
                          detailklontong.image = snapshot.data!.first.image;
                          detailklontong.name = snapshot.data!.first.name;
                          detailklontong.description =
                              snapshot.data!.first.description;
                          return SizedBox(
                              child: Column(
                            children: [
                              Text(
                                'DESCRIPTION',
                                style: TextStyle(
                                    fontSize: 24, color: Color(0xFF461797)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Image.network(
                                  snapshot.data!.first.image.toString()),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data!.first.name.toString(),
                                style: TextStyle(
                                    color: Color(0xFF461797), fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data!.first.description.toString(),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )
                            ],
                          ));
                        } else {
                          return Text('No data');
                        }
                      } else {
                        return CircularProgressIndicator();
                      }
                    })
              ]),
        ),
      ),
    );
  }
}
