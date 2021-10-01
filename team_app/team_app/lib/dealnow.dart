import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'create_deal.dart';

class DealNow extends StatefulWidget {
  const DealNow({Key? key}) : super(key: key);

  @override
  _DealNowState createState() => _DealNowState();
}

class _DealNowState extends State<DealNow> {
  final List<Icon> _category = <Icon>[
    Icon(Icons.dining),
    Icon(Icons.shopping_bag),
    Icon(Icons.tv_sharp),
    Icon(Icons.calendar_today),
    Icon(Icons.calendar_today),
  ];

  final List<String> _dealtitle = <String>[
    'HOTPOT 4 BUY 3',
    'H&M SALE 50 OFF',
    'UltraHD Netflix',
    'MOONCAKE S&P',
    'MOONCAKE S&P',
  ];

  final List<String> _location = <String>[
    'Siam',
    'Siam',
    'none',
    'Central World',
    'Central World',
  ];
  final List<int> _numberofpeople = <int>[3, 3, 3, 3, 3];

  final List<String> _dealdescription = [
    'หารโปรมา 4 จ่าย 3 ค่ะ',
    'หาคนกินบุฟเฟต์เป็นเพื่อนค่ะ',
    'ตี้จัมโบ้หมูกระทะค่ะ',
    'หารตี้ขนมไหว้พระจันทร์ค่ะ',
    'หารตี้ขนมไหว้พระจันทร์ค่ะ',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            ImageSlideshow(
                height: 230,
                autoPlayInterval: 3000,
                isLoop: true,
                children: [
                  Image.asset('image/HOTPOT4BUY3.jpg', fit: BoxFit.cover),
                  Image.asset('image/JUMBODEAL.jpg', fit: BoxFit.cover),
                  Image.asset('image/OISHI4BUY3.jpg', fit: BoxFit.cover),
                  Image.asset('image/MLB50OFF.jpg', fit: BoxFit.cover),
                  Image.asset('image/HMSALE.jpg', fit: BoxFit.cover),
                ]),
            Padding(padding: EdgeInsets.only(top: 15)),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.separated(
                padding: EdgeInsets.all(10),
                itemCount: _dealtitle.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    tileColor: Colors.purple[50],
                    leading: (_category[index]),
                    title: Text(_dealtitle[index]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(_dealdescription[index]),
                        Wrap(
                          spacing: 100.0,
                          children: [
                            Text(_location[index]),
                            Text(_numberofpeople[index].toString()),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        /*add to favorite list*/
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const Divider(color: Colors.blueGrey),
              ),
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
          }),
    );
  }
}
