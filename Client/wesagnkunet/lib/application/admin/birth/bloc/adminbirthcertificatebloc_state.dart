part of 'adminbirthcertificatebloc_bloc.dart';

abstract class AdminBirthCertificateBlocState extends Equatable {
  const AdminBirthCertificateBlocState();

  @override
  List<Object> get props => [];
}

class AdminBirthCertificateBlocInitial extends AdminBirthCertificateBlocState {}

class FetchingBirthCertificatesState extends AdminBirthCertificateBlocState {
  const FetchingBirthCertificatesState();
  @override
  List<Object> get props => [];
}

class FetchedBirthCertificatesState extends AdminBirthCertificateBlocState {
  List<MarriageCertificate> marriageCertificates;
  FetchedBirthCertificatesState({required this.marriageCertificates});
  @override
  List<Object> get props => [marriageCertificates];
}

class FetchBirthCertificatesErrorsState extends AdminBirthCertificateBlocState {
  FetchBirthCertificatesErrorsState({required this.exception});

  Exception exception;
  @override
  List<Object> get props => [exception];
}

class GettingBirthCertificateState extends AdminBirthCertificateBlocState {
  GettingBirthCertificateState();
  @override
  List<Object> get props => [];
}

class LoadedBirthCertificateState extends AdminBirthCertificateBlocState {
  LoadedBirthCertificateState(this.marriageCertificate);
  MarriageCertificate marriageCertificate;
  @override
  List<Object> get props => [marriageCertificate];
}

class LoadBirthCertificateErrorState extends AdminBirthCertificateBlocState {
  Exception exception;
  LoadBirthCertificateErrorState({required this.exception});
  @override
  List<Object> get props => [exception];
}

class DeletedBirthCertificateState extends AdminBirthCertificateBlocState {
  const DeletedBirthCertificateState();
  @override
  List<Object> get props => [];
}

class DeletingBirthCertificateState extends AdminBirthCertificateBlocState {
  const DeletingBirthCertificateState();
}

class DeletionError extends AdminBirthCertificateBlocState {
  DeletionError({required this.exception});
  Exception exception;
}

class ApprovedBirthCertificteState extends AdminBirthCertificateBlocState {
  MarriageCertificate marriageCertificate;
  ApprovedBirthCertificteState({required this.marriageCertificate});
  @override
  List<Object> get props => [marriageCertificate];
}

class ApprovalError extends AdminBirthCertificateBlocState {
  ApprovalError(this.error);
  Error error;

  List<Object> get props => [error];
}

class RejectedBirthCertificateState extends AdminBirthCertificateBlocState {
  MarriageCertificate marriageCertificate;
  RejectedBirthCertificateState(this.marriageCertificate);
  @override
  List<Object> get props => [marriageCertificate];
}

class RejectionError extends AdminBirthCertificateBlocState {
  RejectionError(this.error);
  Error error;
  @override
  List<Object> get props => [error];
}

class UpdatedBirthCertificateState extends AdminBirthCertificateBlocState {
  MarriageCertificate marriageCertificate;
  UpdatedBirthCertificateState({required this.marriageCertificate});

  @override
  List<Object> get props => [marriageCertificate];
}

class UpdateError extends AdminBirthCertificateBlocState {
  UpdateError(this.error);
  Error error;
  @override
  List<Object> get props => [error];
}
