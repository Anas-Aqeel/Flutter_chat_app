import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_app_ui/Auth/authenticator.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> generateChatRoomId(String userId) async {
  var chatRoomId = '${userData["userId"]}$userId';
  dynamic clientData = await firestore.collection('users').doc(userId).get();
  clientData = clientData.data();
  await firestore.collection('users').doc(userId).set({
    ...clientData as Map,
    'chats': [
      ...clientData['chats'],
      {
        'chatterName': userData['name'],
        'chatterDp': userData['profilePic'],
        'chatterEmail': userData['email'],
        'id': userData['userId'], 'chatRoomId': chatRoomId}
    ]
  });
  await firestore.collection('users').doc(userData['userId']).set({
    ...userData as Map,
    'chats': [
      ...userData['chats'],
      {
        'chatterName': clientData['name'],
        'chatterDp': clientData['profilePic'],
        'chatterEmail': clientData['email'],
        'id': clientData['userId'],
        'chatRoomId': chatRoomId}
    ]
  });
  await firestore.collection('chatRoom').doc(chatRoomId).set({
    "chatRoomId": chatRoomId,
    'userOneId': userId,
    "userTwoId": userData['userId'],
  });
  dynamic myUserData =
      await firestore.collection('users').doc(userData['userId']).get();
  userData = myUserData.data();
}
