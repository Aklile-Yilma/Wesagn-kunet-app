part of 'admindeathcertificatebloc_bloc.dart';

abstract class AdminDeathCertificateBlocState extends Equatable {
  const AdminDeathCertificateBlocState();

  @override
  List<Object> get props => [];
}

class AdminDeathCertificateBlocInitial extends AdminDeathCertificateBlocState {}

class FetchingDeathCertificatesState extends AdminDeathCertificateBlocState {
  const FetchingDeathCertificatesState();
  @override
  List<Object> get props => [];
}

class FetchedDeathCertificatesState extends AdminDeathCertificateBlocState {
  List<MarriageCertificate> marriageCertificates;
  FetchedDeathCertificatesState({required this.marriageCertificates});
  @override
  List<Object> get props => [marriageCertificates];
}

class FetchDeathCertificatesErrorsState extends AdminDeathCertificateBlocState {
  FetchDeathCertificatesErrorsState({required this.exception});

  Exception exception;
  @override
  List<Object> get props => [exception];
}

class GettingDeathCertificateState extends AdminDeathCertificateBlocState {
  GettingDeathCertificateState();
  @override
  List<Object> get props => [];
}

class LoadedDeathCertificateState extends AdminDeathCertificateBlocState {
  LoadedDeathCertificateState(this.marriageCertificate);
  MarriageCertificate marriageCertificate;
  @override
  List<Object> get props => [marriageCertificate];
}

class LoadDeathCertificateErrorState extends AdminDeathCertificateBlocState {
  Exception exception;
  LoadDeathCertificateErrorState({required this.exception});
  @override
  List<Object> get props => [exception];
}

class DeletedDeathCertificateState extends AdminDeathCertificateBlocState {
  const DeletedDeathCertificateState();
  @override
  List<Object> get props => [];
}

class DeletingDeathCertificateState extends AdminDeathCertificateBlocState {
  const DeletingDeathCertificateState();
}

class DeletionError extends AdminDeathCertificateBlocState {
  DeletionError({required this.exception});
  Exception exception;
}

class ApprovedDeathCertificteState extends AdminDeathCertificateBlocState {
  MarriageCertificate marriageCertificate;
  ApprovedDeathCertificteState({required this.marriageCertificate});
  @override
  List<Object> get props => [marriageCertificate];
}

class ApprovalError extends AdminDeathCertificateBlocState {
  ApprovalError(this.error);
  Error error;

  List<Object> get props => [error];
}

class RejectedDeathCertificateState extends AdminDeathCertificateBlocState {
  MarriageCertificate marriageCertificate;
  RejectedDeathCertificateState(this.marriageCertificate);
  @override
  List<Object> get props => [marriageCertificate];
}

class RejectionError extends AdminDeathCertificateBlocState {
  RejectionError(this.error);
  Error error;
  @override
  List<Object> get props => [error];
}

class UpdatedDeathCertificateState extends AdminDeathCertificateBlocState {
  MarriageCertificate marriageCertificate;
  UpdatedDeathCertificateState({required this.marriageCertificate});

  @override
  List<Object> get props => [marriageCertificate];
}

class UpdateError extends AdminDeathCertificateBlocState {
  UpdateError(this.error);
  Error error;
  @override
  List<Object> get props => [error];
}
