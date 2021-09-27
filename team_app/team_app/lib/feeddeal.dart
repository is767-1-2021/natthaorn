import 'package:flutter/material.dart';

class FeedDeal extends StatelessWidget {
  final List<String> _dealName = ['HOTPOT', 'OISHI', 'JUMBO'];
  final List<String> _dealDetail = [
    'หารโปรมา 4 จ่าย 3 ค่ะ',
    'หาคนกินบุฟเฟต์เป็นเพื่อนค่ะ',
    'ตี้จัมโบ้หมูกระทะค่ะ'
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Screen'),
      ),
      body: ListView.builder(
          itemCount: _dealName.length,
          /*้เป็นจำนวน*/
          /*index เป็นตัวแทนในแต่ละแถว*/
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('image/restaurant.png'),
                  backgroundColor: Colors.lightBlue[200],
                ),
                title: Text(_dealName[index]),
                subtitle: Text(_dealDetail[index]),
                trailing: Icon(Icons.check),
              ),
            );
          }), /*เป็น function*/
    );
  }
}
