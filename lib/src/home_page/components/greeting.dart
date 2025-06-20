import 'package:flutter/material.dart';

class GreetingSection extends SliverFixedExtentList {
  GreetingSection(double height, {super.key})
    : super(
        delegate: SliverChildBuilderDelegate((BuildContext context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB((0.079 * height), 0, (0.079 * height), (0.079 * height)),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular((0.079 * height)), bottomRight: Radius.circular((0.079 * height))),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB((0.092 * height), 0, 0, (0.099 * height)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text('Plant disease Identifier', style: TextStyle(fontFamily: 'SFBold', fontSize: (0.2 * height), color: Colors.black))],
                ),
              ),
            ),
          );
        }, childCount: 1),
        itemExtent: height,
      );
}
