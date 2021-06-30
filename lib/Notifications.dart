import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NotificationLister extends StatelessWidget {
  const NotificationLister({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Notifications"),
    ),
        body: Container(
            child: ListView.separated(
            itemCount: 25,
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemBuilder: (BuildContext context, int index) {
                return ListTile(
                title: Text('item $index'),
                );
        },
        )
        )
    );
  }
}
