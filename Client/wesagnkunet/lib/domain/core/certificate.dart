

import 'package:wesagnkunet/domain/auth/Client.dart';
import 'package:wesagnkunet/domain/auth/user.dart';

class CertificateDetail{

  List<Client> users;
  DateTime? issueDate;
  DateTime applicationDate;


  CertificateDetail(
    this.users,
    this.issueDate,
    this.applicationDate
  );

}