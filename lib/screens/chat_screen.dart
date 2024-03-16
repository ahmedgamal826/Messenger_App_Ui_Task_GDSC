import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key, required this.name, required this.image})
      : super(key: key);

  final String name;
  final String image;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  List<String> messagesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Stack(alignment: Alignment.bottomRight, children: [
              CircleAvatar(
                radius: 23,
                backgroundImage: AssetImage('${widget.image}'),
              ),
              Stack(alignment: Alignment.center, children: [
                CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  radius: 6,
                  backgroundColor: Colors.green,
                ),
              ])
            ]),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.name}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Active Now',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.phone),
            iconSize: 30,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.video_call_outlined),
            iconSize: 35,
          ),
          CircleAvatar(
            radius: 7,
            backgroundColor: Colors.green,
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messagesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 180, right: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      // height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        color: Colors.blue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          messagesList[index],
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 15),
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                        hintText: 'Send Message...',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: IconButton(
                  onPressed: () {
                    String message = _textController.text;
                    if (message.isNotEmpty) {
                      setState(() {
                        messagesList.add(message);
                        _textController.clear();
                      });
                    }
                  },
                  icon: Icon(
                    Icons.send,
                    size: 35,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
