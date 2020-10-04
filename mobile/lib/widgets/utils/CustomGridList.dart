import 'package:flutter/material.dart';

class CustomGridList extends StatelessWidget {
  final String title;
  final List<String> items;

  CustomGridList(this.title, this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1 / 0,
      padding: EdgeInsets.only(left: 30, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Color(0xff297F4E), fontSize: 12),
          ),
          SizedBox(
            height: 5,
          ),
          _buildList(context)
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      children: items
          .map((item) => Container(
                padding: EdgeInsets.only(bottom: 5),
                width: width * 0.4,
                child: Text(
                  item,
                  style: TextStyle(
                      color: Color(0xff297F4E),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ))
          .toList()
          .cast<Widget>(),
    );
  }
}
