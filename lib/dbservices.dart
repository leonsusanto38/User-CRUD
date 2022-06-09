import 'package:cloud_firestore/cloud_firestore.dart';

import 'dataclass.dart';

CollectionReference tblUser =
    FirebaseFirestore.instance.collection("tabelUser");

class Database {
  static Stream<QuerySnapshot> getData(String email) {
    if (email == "") {
      return tblUser.snapshots();
    } else {
      return tblUser
          // .where("judulCat", isEqualTo: judul)
          .orderBy("email")
          .startAt([email]).endAt([email + '\uf8ff']).snapshots();
    }
  }

  static Future<void> tambahData({required DataUser item}) async {
    DocumentReference docref = tblUser.doc(item.dataEmail);

    await docref
        .set(item.toJson())
        .whenComplete(() => print("Data berhasil di input"))
        .catchError((e) => print(e));
  }

  static Future<void> ubahData({required DataUser item}) async {
    DocumentReference docref = tblUser.doc(item.dataEmail);

    await docref
        .update(item.toJson())
        .whenComplete(() => print("Data berhasil diubah"))
        .catchError((e) => print(e));
  }

  static Future<void> hapusData({required String emailhapus}) async {
    DocumentReference docref = tblUser.doc(emailhapus);

    await docref
        .delete()
        .whenComplete(() => print("Data berhasil dihapus"))
        .catchError((e) => print(e));
  }
}
