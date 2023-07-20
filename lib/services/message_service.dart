import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/message_model.dart';
import '../models/product_model.dart';
import '../models/user_model.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessagesByUserId({int? userId}) {
    try {
      Stream<QuerySnapshot> queryStream = FirebaseFirestore.instance
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots();

      Stream<List<MessageModel>> messageStream =
          queryStream.map((querySnapshot) {
        return querySnapshot.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return MessageModel.fromJson(data);
        }).toList();
      }).map((messages) {
  messages.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
  return messages;
});

      return messageStream;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addMessage({
    UserModel? user,
    bool? isFromUser,
    String? message,
    ProductModel? product,
  }) async {
    try {
      firestore.collection('messages').add({
        'userId': user!.id,
        'userName': user.name,
        'userImage': user.profilePhotoUrl,
        'isFromUser': isFromUser,
        'message': message,
        'product':
            product is UninitiaLizedProductModel ? {} : product!.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then(
        (value) => print('Pesan Telah Berhasil Dikirim'),
      );
    } catch (e) {
      throw Exception('Pesan gagal dikirm !');
    }
  }
}
