import 'package:flutter/material.dart';

class InstructionsSection extends SliverFixedExtentList {
  InstructionsSection(Size size, {super.key})
    : super(
        delegate: SliverChildBuilderDelegate((BuildContext context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              (0.061 * size.height * 0.26),
              (0.071 * size.height * 0.26),
              (0.076 * size.height * 0.26),
              (0.061 * size.height * 0.26),
            ),
            child: Container(
              height: size.height * 0.26,
              decoration: BoxDecoration(
                //color: kSecondary,
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular((0.061 * size.height * 0.26)),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB((0.025 * size.height * 0.26), 0, 0, (0.025 * size.height * 0.26)),
                child: ListView(
                  children: const [
                    ListTile(
                      // leading: CircleAvatar(
                      //   backgroundColor: kMain,
                      //   child: Text(
                      //     '1',
                      //     style: TextStyle(color: kWhite),
                      //   ),
                      // ),
                      title: Text(
                        'Take/Select a photo of affected plant by tapping the camera below',
                        style: TextStyle(
                          color: Colors.black,
                          //color: kWhite
                        ),
                      ),
                    ),
                    ListTile(
                      // leading: CircleAvatar(
                      //    backgroundColor: kMain,
                      //   child: Text(
                      //     '2',
                      //     style: TextStyle(color: kWhite),
                      //   ),
                      // ),
                      title: Text(
                        'It will take little while you can get a suggestion of disease',
                        style: TextStyle(
                          color: Colors.black,

                          ///color: kWhite
                        ),
                      ),
                    ),
                    ListTile(title: Text('')),
                  ],
                ),
              ),
            ),
          );
        }, childCount: 1),
        itemExtent: size.height * 0.26,
      );
}
