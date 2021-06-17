import 'package:flutter/material.dart';

class Request extends StatefulWidget {
  const Request({Key key}) : super(key: key);

  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  int counter = 10;

  @override
  Widget build(BuildContext context) {
    print(counter);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("My Requests"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop<int>(counter);

            setState(() {});
          },
        ),
      ),
      body: Container(
        color: Colors.green[100],
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (BuildContext context, _) => const Divider(
            color: Colors.orange,
            thickness: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text("my name is..fhgfdghfgdfjgfdgkhdhkgdf.")),
                  SizedBox(
                    width: 90,
                    height: 30,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          counter = counter - 1;
                        });
                      },
                      backgroundColor: Colors.blue[200],
                      label: const Text("Accept"),
                      icon: const Icon(Icons.add_box_outlined),
                    ),
                  ),
                  SizedBox(
                    width: 90,
                    height: 30,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          counter = (counter - 1);
                        });
                      },
                      backgroundColor: Colors.red[200],
                      label: const Text("Decline"),
                      icon: const Icon(Icons.delete_forever),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
