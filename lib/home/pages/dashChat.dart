import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:chat_app_ui/Auth/authenticator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dash_chat/dash_chat.dart';

dynamic myChatter;
dynamic myChatRoomId;

// ignore: must_be_immutable
class MyDashChat extends StatefulWidget {
  dynamic chatRoomId;
  dynamic chatterId;
  dynamic chatterName;

  MyDashChat(dynamic chatRoomId, dynamic chatterId, dynamic chatterName) {
    this.chatterId = chatterId;
    this.chatRoomId = chatRoomId;
    myChatter = {'name': chatterName, 'id': chatterId};
    myChatRoomId = chatRoomId;
  }
  @override
  _MyDashChatState createState() => _MyDashChatState();
}

class _MyDashChatState extends State<MyDashChat> {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();

  final ChatUser user = ChatUser(
    name: "${userData['name']}",
    uid: "${userData['userId']}",
    avatar: "${userData['profilePic']}",
  );

  final ChatUser otherUser = ChatUser(
    name: "${myChatter['name']}",
    uid: "${myChatter['id']}",
  );

  List<ChatMessage> messages = <ChatMessage>[];
  var m = <ChatMessage>[];

  var i = 0;

  @override
  void initState() {
    super.initState();
  }

  void systemMessage() {
    Timer(Duration(milliseconds: 300), () {
      if (i < 6) {
        setState(() {
          messages = [...messages, m[i]];
        });
        i++;
      }
      Timer(Duration(milliseconds: 300), () {
        _chatViewKey.currentState!.scrollController
          ..animateTo(
            _chatViewKey
                .currentState!.scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
      });
    });
  }

  void onSend(ChatMessage message) {
    print(message.toJson());
    FirebaseFirestore.instance
        .collection('chatRoom')
        .doc(myChatRoomId)
        .collection('messages')
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(message.toJson());
    setState(() {
      messages = [...messages, message];
      print(messages.length);
    });

    if (i == 0) {
      systemMessage();
      Timer(Duration(milliseconds: 600), () {
        systemMessage();
      });
    } else {
      systemMessage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('chatRoom')
              .doc(myChatRoomId)
              .collection('messages')
              .orderBy("createdAt")
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<DocumentSnapshot> items = snapshot.data!.docs;
              var messages = items
                  .map((i) => ChatMessage.fromJson(i.data() as Map))
                  .toList();
              return DashChat(
                onSend: onSend,
                avatarMaxSize: 80,
                textCapitalization: TextCapitalization.characters,
                key: _chatViewKey,
                inverted: false,
                sendOnEnter: true,
                
                textInputAction: TextInputAction.send,
                user: user,
                quickReplyBuilder: (context){
                  return Text('data');
                },
                onQuickReply: (Reply reply) {
                  setState(() {
                    messages.add(ChatMessage(
                        text: reply.value,
                        createdAt: DateTime.now(),
                        user: user));

                    messages = [...messages];
                  });

                  Timer(Duration(milliseconds: 300), () {
                    _chatViewKey.currentState!.scrollController
                      ..animateTo(
                        _chatViewKey.currentState!.scrollController.position
                            .maxScrollExtent,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                      );

                    if (i == 0) {
                      systemMessage();
                      Timer(Duration(milliseconds: 600), () {
                        systemMessage();
                      });
                    } else {
                      systemMessage();
                    }
                  });
                },
                onLoadEarlier: () {
                  print("laoding...");
                },
                inputDecoration:
                    InputDecoration.collapsed(hintText: "Add message here..."),
                dateFormat: DateFormat('yyyy-MMM-dd'),
                timeFormat: DateFormat('HH:mm'),
                messages: messages,
                showUserAvatar: true,
                showAvatarForEveryMessage: false,
                scrollToBottom: true,
                onPressAvatar: (ChatUser user) {
                  print("OnPressAvatar: ${user.name}");
                },
                onLongPressAvatar: (ChatUser user) {
                  print("OnLongPressAvatar: ${user.name}");
                },
                inputMaxLines: 5,
                messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
                alwaysShowSend: true,
                inputTextStyle: TextStyle(fontSize: 16.0),
                inputContainerStyle: BoxDecoration(
                  border: Border.all(width: 0.0),
                  color: Colors.white,
                ),
                showTraillingBeforeSend: true,
                
                shouldShowLoadEarlier: false,
                trailing: <Widget>[
                  IconButton(
                    icon: Icon(Icons.photo),
                    onPressed: () async {
                      final picker = ImagePicker();
                      XFile? result = await picker.pickImage(
                        source: ImageSource.gallery,
                        imageQuality: 80,
                        maxHeight: 400,
                        maxWidth: 400,
                      );

                      if (result != null) {
                        var imageName = path.basename(result.path);
                        final Reference storageRef =
                            FirebaseStorage.instance.ref('$imageName');

                        final taskSnapshot = await storageRef.putFile(
                          File(result.path),
                        );

                        String url = await taskSnapshot.ref.getDownloadURL();

                        ChatMessage message =
                            ChatMessage(text: "", user: user, image: url);

                        FirebaseFirestore.instance
                            .collection('chatRoom')
                            .doc(myChatRoomId)
                            .collection('messages')
                            .add(message.toJson());
                      }
                    },
                  )
                ],
              );
            }
          }),
    );
  }
}
