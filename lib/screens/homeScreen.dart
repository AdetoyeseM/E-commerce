import 'package:flutter/material.dart';
import 'package:intellivation/screens/home.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomeScreen extends StatefulWidget {
  final String name;

  HomeScreen({Key key, @required this.name}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;

  int _page =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
     // backgroundColor: Colors.transparent,
        //leading: Text('Welcome ${widget.name}'), 
       // actions: <Widget>[
        //  IconButton(
         //   icon: Icon(Icons.exit_to_app),
          //  onPressed: () {
           //   BlocProvider.of<AuthenticationBloc>(context).add(
               // LoggedOut(),
             // );
           // },
         // )
       // ],
     // ),
       
    body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: List.generate(5, (index) => Home()),
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Theme.of(context).primaryColor,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Theme.of(context).accentColor,
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Colors.grey[500]),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Feather.getIconData("home"),
              ),
              title: Container(height: 0.0),
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Feather.getIconData("heart"),
              ),
              title: Container(height: 0.0),
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Feather.getIconData("user"),
              ),
              title: Container(height: 0.0),
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Feather.getIconData("grid"),
              ),
              title: Container(height: 0.0),
            ),
             

             
           
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),

    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 2);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
