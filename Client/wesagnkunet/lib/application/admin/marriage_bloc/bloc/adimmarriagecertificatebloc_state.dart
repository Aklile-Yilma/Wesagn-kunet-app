part of 'adimmarriagecertificatebloc_bloc.dart';

abstract class AdminMarriageCertificateBlocState extends Equatable {
  const AdminMarriageCertificateBlocState();

  @override
  List<Object> get props => [];
}

class AdimMarriageCertificateBlocInit
    extends AdminMarriageCertificateBlocState {}

class FetchingMarriageCertificatesState
    extends AdminMarriageCertificateBlocState {
  const FetchingMarriageCertificatesState();
  @override
  List<Object> get props => [];
}

class FetchedMarriageCertificatesState
    extends AdminMarriageCertificateBlocState {
  List<MarriageCertificate> marriageCertificates;
  FetchedMarriageCertificatesState({required this.marriageCertificates});
  @override
  List<Object> get props => [marriageCertificates];
}

class FetchMarriageCertificatesErrorsState
    extends AdminMarriageCertificateBlocState {
  FetchMarriageCertificatesErrorsState({required this.exception});

  Exception exception;
  @override
  List<Object> get props => [exception];
}

class GettingMarriageCertificateState
    extends AdminMarriageCertificateBlocState {
  GettingMarriageCertificateState();
  @override
  List<Object> get props => [];
}

class LoadedMarriageCertificateState extends AdminMarriageCertificateBlocState {
  LoadedMarriageCertificateState(this.marriageCertificate);
  MarriageCertificate marriageCertificate;
  @override
  List<Object> get props => [marriageCertificate];
}

class LoadMarriageCertificateErrorState
    extends AdminMarriageCertificateBlocState {
  Exception exception;
  LoadMarriageCertificateErrorState({required this.exception});
  @override
  List<Object> get props => [exception];
}

class DeletedMarriageCertificateState
    extends AdminMarriageCertificateBlocState {
  const DeletedMarriageCertificateState();
  @override
  List<Object> get props => [];
}

class DeletingMarriageCertificateState
    extends AdminMarriageCertificateBlocEvent {
  const DeletingMarriageCertificateState();
}

class DeletionError extends AdminMarriageCertificateBlocState {
  DeletionError({required this.exception});
  Exception exception;
}

class ApprovedMarriageCertificteState
    extends AdminMarriageCertificateBlocState {
  MarriageCertificate marriageCertificate;
  ApprovedMarriageCertificteState({required this.marriageCertificate});
  @override
  List<Object> get props => [marriageCertificate];
}

class ApprovalError extends AdminMarriageCertificateBlocState {
  ApprovalError(this.error);
  Error error;

    List<Object> get props =>[error];
}

class RejectedMarriageCertificateState
    extends AdminMarriageCertificateBlocState {
  MarriageCertificate marriageCertificate;
  RejectedMarriageCertificateState( this.marriageCertificate);
  @override
  List<Object> get props => [marriageCertificate];
}

class RejectionError extends AdminMarriageCertificateBlocState {
  RejectionError(this.error);
  Error error;
  @override
  List<Object> get props => [error];
}

class UpdatedMarriageCertificateState
    extends AdminMarriageCertificateBlocState {
  MarriageCertificate marriageCertificate;
  UpdatedMarriageCertificateState({required this.marriageCertificate});

  @override
  List<Object> get props => [marriageCertificate];
}

class UpdateError extends AdminMarriageCertificateBlocState {
  UpdateError(this.error);
  Error error;
  @override
  List<Object> get props => [error];
}
