part of 'birth_certificate_form_bloc.dart';

abstract class BirthCertificateFormEvent extends Equatable {
  const BirthCertificateFormEvent();
}

class SubmiteBirthCertificateFormEvent extends BirthCertificateFormEvent {
  String childFirstName,
      childMiddleName,
      childLastName,
      fatherFirstName,
      fatherMiddleName,
      fatherLastName,
      motherFirstName,
      motherMiddleName,
      motherLastName;
  DateTime dateOfBirth;

  SubmiteBirthCertificateFormEvent(
      this.childFirstName,
      this.childMiddleName,
      this.childLastName,
      this.fatherFirstName,
      this.fatherMiddleName,
      this.fatherLastName,
      this.motherFirstName,
      this.motherMiddleName,
      this.motherLastName,
      this.dateOfBirth);
  @override
  List<Object?> get props => [];
}
