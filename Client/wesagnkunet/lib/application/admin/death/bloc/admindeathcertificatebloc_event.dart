part of 'admindeathcertificatebloc_bloc.dart';

abstract class AdminDeathCertificateBlocEvent extends Equatable {
  const AdminDeathCertificateBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchDeathCertificatesEvent extends AdminDeathCertificateBlocEvent {
  const FetchDeathCertificatesEvent();

  @override
  List<Object> get props => [];
}

class GetSingleDeathCertificateEvent extends AdminDeathCertificateBlocEvent {
  GetSingleDeathCertificateEvent(this.certificateId);
  int certificateId;

  @override
  List<Object> get props => [certificateId];
}

class ApproveDeathCertificateEvent extends AdminDeathCertificateBlocEvent {
  ApproveDeathCertificateEvent(this.certificateId);
  int certificateId;

  @override
  List<Object> get props => [certificateId];
}

class RejectDeathCertificateEvent extends AdminDeathCertificateBlocEvent {
  RejectDeathCertificateEvent(this.certificateId);
  int certificateId;

  @override
  List<Object> get props => [certificateId];
}

class DeleteDeathCertificateEvent extends AdminDeathCertificateBlocEvent {
  DeleteDeathCertificateEvent(this.certificateId);
  int certificateId;

  @override
  List<Object> get props => [certificateId];
}

class UpdateDeathCertificateEvent extends AdminDeathCertificateBlocEvent {
  UpdateDeathCertificateEvent(this.certificateId);
  int certificateId;

  @override
  List<Object> get props => [certificateId];
}
