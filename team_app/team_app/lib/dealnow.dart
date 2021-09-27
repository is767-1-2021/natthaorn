import 'package:flutter/material.dart';

class Dealnow extends StatefulWidget {
  const Dealnow({Key? key}) : super(key: key);

  @override
  _DealnowState createState() => _DealnowState();
}

class _DealnowState extends State<Dealnow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Tutorial'),
      ),
      body: Center(
        //*wrap the card with center */
        child: Card(
          color: Colors.amber[200],
          child: Container(
            padding: EdgeInsets.all(10),
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Night Rain in the city | Sleep, Relax & Study Sounds | Ambient Noise.',
                    style: TextStyle(fontSize: 20)),
                SizedBox(height: 10.0),
                Text('Card 2',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
