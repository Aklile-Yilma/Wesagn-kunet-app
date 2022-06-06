part of 'death_certificate_form_bloc.dart';

abstract class DeathCertificateFormEvent extends Equatable {
  const DeathCertificateFormEvent();
}

class SubmitDeathCertificateFormEvent extends DeathCertificateFormEvent {
  String deceasedFirstName,
      deceasedMiddleName,
      deceasedLastName,
      nationality,
      country,
      city,
      subcity,
      title,
      woreda,
      housenumber;

  DateTime dateOfBirth, dateOfDeath;

  SubmitDeathCertificateFormEvent(
      this.deceasedFirstName,
      this.deceasedMiddleName,
      this.deceasedLastName,
      this.title,
      this.dateOfBirth,
      this.dateOfDeath,
      this.country,
      this.nationality,
      this.city,
      this.subcity,
      this.woreda,
      this.housenumber);
  @override
  List<Object?> get props => [];
}
