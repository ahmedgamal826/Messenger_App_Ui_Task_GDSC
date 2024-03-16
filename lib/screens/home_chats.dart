import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:messenger_app/model/chats_model.dart';
import 'package:messenger_app/screens/chat_screen.dart';
import 'package:messenger_app/screens/login_page.dart';
import 'package:messenger_app/screens/profile_screen.dart';

class HomeChats extends StatelessWidget {
  const HomeChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileScreen('')));
          },
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/ahmed.jpg'),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Chats',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                icon: Icon(
                  Icons.arrow_forward,
                  size: 30,
                  color: Colors.black,
                ),
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  contentPadding: EdgeInsets.all(5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatScreen(
                                      name: ChatsList[index].name,
                                      image: ChatsList[index].image,
                                    )));
                      },
                      child: Column(
                        children: [
                          Stack(alignment: Alignment.bottomRight, children: [
                            CircleAvatar(
                              radius: 32,
                              backgroundImage:
                                  AssetImage(ChatsList[index].image),
                            ),
                            Stack(alignment: Alignment.center, children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 11,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 7,
                              ),
                            ]),
                          ]),
                          Text(ChatsList[index].name),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: ChatsList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                    name: ChatsList[index].name,
                                    image: ChatsList[index].image,
                                  )));
                    },
                    child: ListTile(
                      leading:
                          Stack(alignment: Alignment.bottomRight, children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundImage: AssetImage(ChatsList[index].image),
                        ),
                        Stack(alignment: Alignment.center, children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 11,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 7,
                          ),
                        ]),
                      ]),
                      title: Text(
                        ChatsList[index].name,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      subtitle: Text(ChatsList[index].message),
                      trailing: Text(
                        ChatsList[index].time,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
