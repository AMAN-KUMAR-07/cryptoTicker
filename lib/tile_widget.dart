import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TileClass extends StatelessWidget {
  final String imageUrl;
  final String symbol;
  final String name;
  final String percent;
  final String price;
  const TileClass(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.percent,
      required this.price,
      required this.symbol})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fc = percent.substring(0, 1);
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 70,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: SvgPicture.network(imageUrl),
            ),
          ),
          Container(
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(symbol), Text(name)],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            width: 30,
            child: (fc == '-')
                ? Icon(
                    Icons.arrow_downward_outlined,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.arrow_upward_outlined,
                    color: Colors.green,
                  ),
          ),
          Container(
              width: 60,
              alignment: Alignment.centerLeft,
              child: Text(percent + '%')),
          Container(
            width: 90,
            child: Text(
              price.toString().split('.').first,
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
