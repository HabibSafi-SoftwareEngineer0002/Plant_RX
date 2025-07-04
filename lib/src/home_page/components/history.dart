import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../constants/constants.dart';
import '../../../services/disease_provider.dart';
import '../../../services/hive_database.dart';
import '../../suggestions_page/suggestions.dart';
import '../models/disease_model.dart';

class HistorySection extends SliverFixedExtentList {
  HistorySection(Size size, BuildContext context, DiseaseService diseaseService, {super.key})
    : super(
        delegate: SliverChildBuilderDelegate((BuildContext context, index) {
          return ValueListenableBuilder<Box<Disease>>(
            valueListenable: Boxes.getDiseases().listenable(),
            builder: (context, box, _) {
              final diseases = box.values.toList().cast<Disease>();

              if (diseases.isNotEmpty) {
                return Padding(
                  padding: EdgeInsets.fromLTRB((0.053 * size.height * 0.3), (0.053 * size.height * 0.3), 0, 0),
                  child: SizedBox(
                    width: size.width,
                    child: ListView.builder(
                      itemCount: diseases.length,
                      padding: EdgeInsets.symmetric(vertical: (0.035 * size.height * 0.3)),
                      itemExtent: size.width * 0.9,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _returnHistoryContainer(diseases[index], context, diseaseService, size);
                      },
                    ),
                  ),
                );
              } else {
                return _returnNothingToShow(size);
              }
            },
          );
        }, childCount: 1),
        itemExtent: size.height * 0.3,
      );
}

Widget _returnHistoryContainer(Disease disease, BuildContext context, DiseaseService diseaseService, Size size) {
  return Padding(
    padding: EdgeInsets.fromLTRB((0.053 * size.height * 0.3), 0, (0.053 * size.height * 0.3), 0),
    child: GestureDetector(
      onTap: () {
        // Set disease for Disease Service
        diseaseService.setDiseaseValue(disease);

        Navigator.restorablePushNamed(context, Suggestions.routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: Image.file(File(disease.imagePath), fit: BoxFit.cover).image),
          boxShadow: [BoxShadow(color: kAccent, spreadRadius: 0.5, blurRadius: (0.022 * size.height * 0.3))],
          color: kSecondary,
          borderRadius: BorderRadius.circular((0.053 * size.height * 0.3)),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('Disease: ${disease.name}', style: TextStyle(color: kWhite, fontSize: (0.066 * size.height * 0.3), fontFamily: 'SFBold')),
              // Text(
              //   'Date: ${disease.dateTime.day}/${disease.dateTime.month}/${disease.dateTime.year}',
              //   style: TextStyle(color: kWhite, fontSize: (0.066 * size.height * 0.3), fontFamily: 'SFBold'),
              // ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _returnNothingToShow(Size size) {
  return Padding(
    padding: EdgeInsets.fromLTRB((0.053 * size.height * 0.3), (0.053 * size.height * 0.3), (0.053 * size.height * 0.3), 0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        //color: kSecondary,
        borderRadius: BorderRadius.circular((0.053 * size.height * 0.3)),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, (0.066 * size.height * 0.3)),
        child: const Center(child: Text('Nothing to show', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
      ),
    ),
  );
}
