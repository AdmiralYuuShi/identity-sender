import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../lib.dart';

class IdentityProvider {
  CollectionReference identityRef =
      FirebaseFirestore.instance.collection('simfotos');
  final StorageReference storageReference =
      FirebaseStorage().ref().child('simfotos');

  Stream<List<IdentityResponse>> getAllIdentity() {
    return identityRef.snapshots().map((response) {
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

    String imageUrl;
    final StreamSubscription<StorageTaskEvent> streamSubscription =
        uploadTask.events.listen((event) async {
      if (event.type == StorageTaskEventType.success) {
        var downloadUrl = await event.snapshot.ref.getDownloadURL();
        imageUrl = downloadUrl.toString();
      }
    });
    streamSubscription.onError(() {
      return;
    });
    await uploadTask.onComplete;
    streamSubscription.cancel();
    if (imageUrl != null) {
      return identityRef.add({
        'type': request.type,
        'image_url': imageUrl,
        'description': request.description,
        'date_upload': '${request.dateUpload.millisecondsSinceEpoch}'
      }).catchError((e) => print('Error adding new Identity : $e'));
    } else {
      return;
    }
  }
}
