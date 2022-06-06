part of 'death_certificate_form_bloc.dart';

abstract class DeathCertificateFormState extends Equatable {
  const DeathCertificateFormState();
}

class DeathCertificateFormInitial extends DeathCertificateFormState {
  @override
  List<Object?> get props => [];
}

class SubmittingDeathCerificateFormState extends DeathCertificateFormState {
  @override
  List<Object?> get props => [];
}

class SubmittedDeathCertificateFormState extends DeathCertificateFormState {
  @override
  List<Object?> get props => [];
}

class FailedSubmittingFormState extends DeathCertificateFormState {
  FailedSubmittingFormState(this.error);
  Error error;
  @override
  List<Object?> get props => [error];
}
