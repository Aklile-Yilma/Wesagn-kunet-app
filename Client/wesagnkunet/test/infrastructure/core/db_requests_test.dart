
import 'package:flutter_test/flutter_test.dart';
import 'package:wesagnkunet/domain/core/certificate.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/core/db_requests.dart';
import 'package:wesagnkunet/infrastructure/lib/localdb/DBClient.dart';


MarriageCertificate INSERT_CERTIFICATE = MarriageCertificate(
                                                      10,
                                                      Spouse(
                                                        "Kim",
                                                        "Mathew",
                                                        "Mathers"
                                                      ),
                                                      Spouse(
                                                        "Marshall",
                                                        "Mathew",
                                                        "Mathers"
                                                      ),
                                                      CertificateDetail(
                                                        [],
                                                        DateTime.now(),
                                                        DateTime.now()
                                                      ),
                                                      DateTime.now(),
                                                      false,
                                                    );




Future testInsertMarriageCertificateDBRequest(DBClient client) async{

  int? id = await client.execute(InsertMarriageCertificateDBRequest(INSERT_CERTIFICATE));
  expect(id, isNot(null));
  expect(id, INSERT_CERTIFICATE.id);
}



void main() {
  
  DBClient dbClient = DBClient("cache.sqlite");

  group("Marriage Certificate DB Request", (){


    test("Marraige Certificate Insert", () async{
      await testInsertMarriageCertificateDBRequest(dbClient);
    });


  });


}