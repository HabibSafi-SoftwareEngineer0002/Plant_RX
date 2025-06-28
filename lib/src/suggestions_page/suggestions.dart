import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plant_rx/src/Login_screen.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../services/disease_provider.dart';
import '../home_page/models/disease_model.dart';
import 'components/plant_image.dart';
import 'components/text_property.dart';

class Suggestions extends StatelessWidget {
  const Suggestions({super.key});

  static const routeName = '/suggestions';

  @override
  Widget build(BuildContext context) {
    // Get disease from provider
    final diseaseService = Provider.of<DiseaseService>(context);


    // final User?user=FirebaseAuth.instance.currentUser;


    // final String? userName = user?.displayName;
    // final String? userEmail = user?.email;
    // final String? userPhotoUrl = user?.photoURL;

    Future<User?>_getFreshUser() async {
      final user=FirebaseAuth.instance.currentUser;
      if(user!=null){
        await user.reload();
        return FirebaseAuth.instance.currentUser;
      }
      return null;




    }

    Disease disease = diseaseService.disease;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMain,
        title: const Text('Care Suggestions'),
        centerTitle: true,
        actions: [
          Builder(builder: (context)=>
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
          ),
        ],
      ),
      endDrawer: Drawer(
      child: FutureBuilder<User?>(
        future: _getFreshUser(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return CircularProgressIndicator(color: Colors.green,);
          }
          final user =snapshot.data!;
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(

                accountName: Text(user.displayName??"",style: TextStyle(fontSize: 18),),
                accountEmail: Text(user.email ??"",style: TextStyle(fontSize: 16),),
                // currentAccountPicture: CircleAvatar(
                //   backgroundImage: NetworkImage(
                //     "https://i.pravatar.cc/150?img=3", // Replace with user's image
                //   ),
                // ),
                decoration: BoxDecoration(color: Colors.green),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: ()async {
                  await FirebaseAuth.instance.signOut();
                  // Perform logout logic here
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  // Close drawer
                  // Then navigate to login screen if needed
                },
              ),

            ],
          );
        },

      ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgr.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all((0.02 * size.height)),
          child: Column(
            children: [
              Flexible(
                child: Center(
                  child: PlantImage(
                    size: size,
                    imageFile: File(disease.imagePath),
                  ),
                ),
              ),
              Divider(
                thickness: (0.0066 * size.height),
                height: (0.013 * size.height),
              ),
              SizedBox(
                height: size.height * 0.5,
                child: ListView(
                  children: [
                    TextProperty(
                      title: 'Disease name',
                      value: disease.name,
                      height: size.height,
                    ),
                    TextProperty(
                      title: 'Possible causes',
                      value: disease.possibleCauses,
                      height: size.height,
                    ),
                    TextProperty(
                      title: 'Possible solution',
                      value: disease.possibleSolution,
                      height: size.height,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
