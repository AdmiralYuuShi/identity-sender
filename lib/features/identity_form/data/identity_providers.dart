import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';

import '../../../lib.dart';

class IdentityProvider {
  CollectionReference identityRef =
      FirebaseFirestore.instance.collection('simfotos');
  final StorageReference storageReference =
      FirebaseStorage().ref().child('simfotos');

  Stream<List<IdentityResponse>> getAllIdentity({@required String userId}) {
    return identityRef
        .where('user_id', isEqualTo: userId)
        .orderBy('date_upload', descending: true)
        .snapshots()
        .map((response) {
      return response.docs
          .map((document) => IdentityResponse.fromJson(document.data()))
          .toList();
    });
  }

  Future<void> addIdentity({IdentityRequest request}) async {
    List<String> splitPath = request.image.path.split('/');
    String filename = splitPath[splitPath.length - 1];
    final StorageUploadTask uploadTask =
        storageReference.child(filename).putFile(request.image);

    final StreamSubscription<StorageTaskEvent> streamSubscription =
        uploadTask.events.listen((event) async {
      if (event.type == StorageTaskEventType.success) {
        var downloadUrl = await event.snapshot.ref.getDownloadURL();
        if (downloadUrl != null) {
          return identityRef
              .add({
                'user_id': request.userId,
                'type': request.type,
                'image_url': downloadUrl.toString(),
                'description': request.description,
                'date_upload': request.dateUpload.millisecondsSinceEpoch
              })
              .then((value) => print('Success Add New Identity'))
              .catchError((e) => print('Error adding new Identity : $e'));
        } else {
          print('Failed Add New Data');
          return null;
        }
      }
      if (event.type == StorageTaskEventType.failure) {
        print('Upload Image Failure');
        return null;
      }
    });
    await uploadTask.onComplete;
    streamSubscription.cancel();
  }
}
