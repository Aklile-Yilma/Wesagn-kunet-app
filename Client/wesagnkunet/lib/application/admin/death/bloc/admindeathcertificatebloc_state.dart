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
  List<DeathCertificate> deathCertificates;
  FetchedDeathCertificatesState({required this.deathCertificates});
  @override
  List<Object> get props => [deathCertificates];
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
  LoadedDeathCertificateState(this.deathCertificate);
  DeathCertificate deathCertificate;
  @override
  List<Object> get props => [deathCertificate];
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
  DeathCertificate deathCertificate;
  ApprovedDeathCertificteState({required this.deathCertificate});
  @override
  List<Object> get props => [deathCertificate];
}

class ApprovalError extends AdminDeathCertificateBlocState {
  ApprovalError(this.error);
  Error error;

  List<Object> get props => [error];
}

class RejectedDeathCertificateState extends AdminDeathCertificateBlocState {
  DeathCertificate deathCertificate;
  RejectedDeathCertificateState(this.deathCertificate);
  @override
  List<Object> get props => [deathCertificate];
}

class RejectionError extends AdminDeathCertificateBlocState {
  RejectionError(this.error);
  Error error;
  @override
  List<Object> get props => [error];
}

class UpdatedDeathCertificateState extends AdminDeathCertificateBlocState {
  DeathCertificate deathCertificate;
  UpdatedDeathCertificateState({required this.deathCertificate});

  @override
  List<Object> get props => [deathCertificate];
}

class UpdateError extends AdminDeathCertificateBlocState {
  UpdateError(this.error);
  Error error;
  @override
  List<Object> get props => [error];
}
