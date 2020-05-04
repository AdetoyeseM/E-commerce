import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column( 
        children: <Widget>[
        Column(
           mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                      Container(
                          padding: const EdgeInsets.all(60),
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration( 
                            image: DecorationImage(image: AssetImage('assets/images/download.png'),
                             )),
                          ),
                      
                      ]

          
          ),
         
        ]
        
    );
  }
}
