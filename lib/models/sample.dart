import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 100,
          child: Text('Box 1'),
          color: Colors.red,
        ),
        Flexible(
          flex: 5,
          fit: FlexFit.tight,
          child: Container(
            height: 100,
            child: Text('Box 2'),
            color: Colors.blue,
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Container(
            height: 100,
            child: Text('Box 3'),
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
