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
  GetSingleMarriageCertificateEvent(this.certificateId);
  int certificateId;

  @override
  List<Object> get props => [certificateId];
}

class ApproveMarriageCertificateEvent
    extends AdminMarriageCertificateBlocEvent {
  ApproveMarriageCertificateEvent(this.certificateId);
  int certificateId;

  @override
  List<Object> get props => [certificateId];
}

class RejectMarriageCertificateEvent extends AdminMarriageCertificateBlocEvent {
  RejectMarriageCertificateEvent(this.certificateId);
  int certificateId;

  @override
  List<Object> get props => [certificateId];
}

class DeleteMarriageCertificateEvent extends AdminMarriageCertificateBlocEvent {
  DeleteMarriageCertificateEvent(this.certificateId);
  int certificateId;

  @override
  List<Object> get props => [certificateId];
}

class UpdateMarriageCertificateEvent extends AdminMarriageCertificateBlocEvent {
  UpdateMarriageCertificateEvent(this.certificateId);
  int certificateId;

  @override
  List<Object> get props => [certificateId];
}
