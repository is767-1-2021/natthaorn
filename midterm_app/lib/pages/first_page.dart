import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:midterm_app/model/dealFormModel.dart';
import 'package:provider/provider.dart';

class firstPage extends StatefulWidget {
  const firstPage({Key? key}) : super(key: key);

  @override
  _firstPageState createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  String? _dealName;
  String? _dealdetail;
  String? _deallocation;
  int? _dealParty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deal Now'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            ImageSlideshow(
                height: 230,
                autoPlayInterval: 3000,
                isLoop: true,
                children: [
                  Image.asset('assets/HOTPOT4BUY3.jpg', fit: BoxFit.cover),
                  Image.asset('assets/JUMBODEAL.jpg', fit: BoxFit.cover),
                  Image.asset('assets/OISHI4BUY3.jpg', fit: BoxFit.cover),
                  Image.asset('assets/MLB50OFF.jpg', fit: BoxFit.cover),
                  Image.asset('assets/HMSALE.jpg', fit: BoxFit.cover),
                ]),
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Consumer<dealFormModel>(builder: (context, form, child) {
                return ListTile(
                  tileColor: Colors.lightBlue[100],
                  leading: Icon(Icons.new_releases_outlined),
                  title: Text('${form.dealName}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${form.dealdetial}'),
                      Wrap(
                        spacing: 100.0,
                        children: [
                          Text('${form.deallocation}'),
                          Text('${form.dealParty}'),
                        ],
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.favorite_outline),
                    onPressed: () {},
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
