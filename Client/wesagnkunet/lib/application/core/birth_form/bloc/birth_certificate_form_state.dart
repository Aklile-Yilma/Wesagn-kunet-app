part of 'birth_certificate_form_bloc.dart';

abstract class BirthCertificateFormState extends Equatable {
  const BirthCertificateFormState();
}

class BirthCertificateFormInitial extends BirthCertificateFormState {
  @override
  List<Object> get props => [];
}

class SubmittingBirthCertificateFormState extends BirthCertificateFormState {
  @override
  List<Object> get props => [];
}

class SubmittedBirthCertificateFormState extends BirthCertificateFormState {
  @override
  List<Object> get props => [];
}

class FailedToSubmitForm extends BirthCertificateFormState {
  Error error;
  FailedToSubmitForm(this.error);
  @override
  List<Object> get props => [error];
}
