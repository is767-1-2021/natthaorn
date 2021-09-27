import 'package:flutter/material.dart';
import 'create_deal.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Searchbar extends StatelessWidget {
  final List<String> _dealTitle = <String>[
    'HOTPOT 4 BUY 3',
    'H&M SALE 50 OFF',
    'UltraHD Netflix',
    'Apple Airpod'
  ];
  final List<String> _dealDesc = <String>[
    'หาตี้ 4 จ่าย 3',
    'หาคนลดค่า',
    'หาบ้านหารค่ะ',
    'หารคนหารค่า'
  ];
  final List<String> _dealLocation = <String>[
    'Siam',
    'Siam',
    'none',
    'Central Ladpaow'
  ];
  final List<int> _dealPerson = <int>[3, 3, 3, 1];
  final List<int> _colorCodes = <int>[600, 500, 300, 100];

  final List<String> _dealName = ['HOTPOT', 'OISHI', 'JUMBO'];
  final List<String> _dealDetail = [
    'หารโปรมา 4 จ่าย 3 ค่ะ',
    'หาคนกินบุฟเฟต์เป็นเพื่อนค่ะ',
    'ตี้จัมโบ้หมูกระทะค่ะ'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search App'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
      //drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ImageSlideshow(
                height: 300,
                autoPlayInterval: 3000,
                isLoop: true,
                children: [
                  Image.asset('image/HOTPOT4BUY3.jpg', fit: BoxFit.cover),
                  Image.asset('image/JUMBODEAL.jpg', fit: BoxFit.cover),
                  Image.asset('image/OISHI4BUY3.jpg', fit: BoxFit.cover),
                  Image.asset('image/MLB50OFF.jpg', fit: BoxFit.cover),
                  Image.asset('image/HMSALE.jpg', fit: BoxFit.cover),
                ]),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                  itemCount: _dealName.length,
                  /*้เป็นจำนวน*/
                  /*index เป็นตัวแทนในแต่ละแถว*/
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.dining),
                        title: Text(_dealName[index]),
                        subtitle: Text(_dealDetail[index]),
                        trailing: Icon(Icons.check),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple[600],
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateDeal()));
        },
      ),
    );
  }
}

Widget testbuildvertical() => ListView(
      children: [
        ListTile(
          title: Text('HOTPOT 4 BUY 3'),
        ),
      ],
    );

class DataSearch extends SearchDelegate<String> {
  final keywords = [
    "Bubble Tea",
    "Netflix",
    "Viu",
    "Croissant",
    "Bakery",
    "Shabu",
    "Tepanyaki",
    "Yakiniku",
    "Movies",
    "Clothes",
    "Accessories",
    "Apple Back To School",
  ];
  final recentkeywords = [
    "Bubble Tea",
    "Netflix",
    "Viu",
    "Croissant",
  ]; // **history search

  @override
  List<Widget> buildActions(BuildContext context) {
    // what action we want perform for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon onthe left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context,
            ""); //* โค้ดจริงๆให้ใส่ null แต่เครือ่งบอกใส่ไม่ได้ เป็น not null
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    return Center(
      //*ครอบทุกอันให้อยู่ตรงกลาง
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          //**ครอบด้วย container สร้างกรอบสีแดงให้อยู่ตรงกลาง  */
          color: Colors.red[400],
          child: Center(
            //*จัด text ตรงกลาง
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when user searchs for something
    final suggestionList = query.isEmpty
        ? recentkeywords
        : keywords
            .where((p) => p.startsWith(query))
            .toList(); //*predict element from start value **Case Sensitive

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.ac_unit),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(
                //* แต่งสีตอนที่พิม search keywords
                color: Colors.indigo[600],
                fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: suggestionList[index]
                      .substring(query.length), //*ทำสีตัว suggestion
                  style: TextStyle(color: Colors.grey[400]))
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
