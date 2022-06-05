part of 'adminbirthcertificatebloc_bloc.dart';

abstract class AdminBirthCertificateBlocEvent extends Equatable {
  const AdminBirthCertificateBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchBirthCertificatesEvent extends AdminBirthCertificateBlocEvent {
  const FetchBirthCertificatesEvent();

  @override
  List<Object> get props => [];
}

class GetSingleBirthCertificateEvent extends AdminBirthCertificateBlocEvent {
  GetSingleBirthCertificateEvent(this.certificateId);
  int certificateId;

  @override
  List<Object> get props => [certificateId];
}

class ApproveBirthCertificateEvent extends AdminBirthCertificateBlocEvent {
  ApproveBirthCertificateEvent(this.certificateId);
  int certificateId;

  @override
  List<Object> get props => [certificateId];
}

class RejectBirthCertificateEvent extends AdminBirthCertificateBlocEvent {
  RejectBirthCertificateEvent(this.certificateId);
  int certificateId;

  @override
  List<Object> get props => [certificateId];
}

class DeleteBirthCertificateEvent extends AdminBirthCertificateBlocEvent {
  DeleteBirthCertificateEvent(this.certificateId);
  int certificateId;

  @override
  List<Object> get props => [certificateId];
}

class UpdateBirthCertificateEvent extends AdminBirthCertificateBlocEvent {
  UpdateBirthCertificateEvent(this.certificateId);
  int certificateId;

  @override
  List<Object> get props => [certificateId];
}
