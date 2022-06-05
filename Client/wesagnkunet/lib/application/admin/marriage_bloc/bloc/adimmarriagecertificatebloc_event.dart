part of 'adimmarriagecertificatebloc_bloc.dart';

abstract class AdminMarriageCertificateBlocEvent extends Equatable {
  const AdminMarriageCertificateBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchMarriageCertificatesEvent extends AdminMarriageCertificateBlocEvent {
  const FetchMarriageCertificatesEvent();

  @override
  List<Object> get props => [];
}

class GetSingleMarriageCertificateEvent
    extends AdminMarriageCertificateBlocEvent {
   GetSingleMarriageCertificateEvent(this.id);
  int id;

  @override
  List<Object> get props => [];
}

class ApproveMarriageCertificateEvent
    extends AdminMarriageCertificateBlocEvent {
  ApproveMarriageCertificateEvent(this.marriageCertificate, this.status);

  bool status;
  MarriageCertificate marriageCertificate;

  @override
  List<Object> get props => [marriageCertificate, status];
}

class RejectMarriageCertificateEvent extends AdminMarriageCertificateBlocEvent {
  RejectMarriageCertificateEvent(this.marriageCertificate, this.rejected);
  MarriageCertificate marriageCertificate;
  bool rejected;

  @override
  List<Object> get props => [marriageCertificate, rejected];
}

class DeleteMarriageCertificateEvent extends AdminMarriageCertificateBlocEvent {
  DeleteMarriageCertificateEvent(this.marriageCertificate);
  MarriageCertificate marriageCertificate;

  @override
  List<Object> get props => [marriageCertificate];
}

class UpdateMarriageCertificateEvent extends AdminMarriageCertificateBlocEvent {
  UpdateMarriageCertificateEvent(
      this.marriageCertificate, this.issuedTime, this.status);
  DateTime issuedTime;
  bool status;

  MarriageCertificate marriageCertificate;
  @override
  List<Object> get props => [marriageCertificate, issuedTime, status];
}
