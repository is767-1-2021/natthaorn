import 'package:flutter/material.dart';

import 'create_deal.dart';

class Searchbar extends StatelessWidget {
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
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('image/HOTPOT4BUY3.jpg'),
            Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 100,
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      child: Image.asset('image/logoHotpot.png'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text('HOTPOT 4 BUY 3'),
                        Text('Detail about promotion'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 100,
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      child: Image.asset('image/logoHotpot.png'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text('HOTPOT 4 BUY 3'),
                        Text('Detail about promotion'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 100,
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      child: Image.asset('image/logoHotpot.png'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        //**รายละเอียดใน deal */
                        Text('HOTPOT 4 BUY 3'),
                        Text('Detail about promotion'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateDeal()));
        },
      ), // Drawer from left,but if we use with Datasearch it cannot use endDrawer
    );
  }
}

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
