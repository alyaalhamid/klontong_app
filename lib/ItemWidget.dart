import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({super.key, required this.image, required this.press});
  final String image;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: InkWell(
            onTap: press,
            child: Column(
              children: [
                Image.network(
                  image,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('DESCRIPTION'),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
