import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wesagnkunet/domain/core/certificate.dart';
import 'package:wesagnkunet/domain/core/death_certificates.dart';
import 'package:wesagnkunet/infrastructure/core/providers.dart';
import 'package:wesagnkunet/infrastructure/core/repositories.dart';

part 'death_certificate_form_event.dart';
part 'death_certificate_form_state.dart';

class DeathCertificateFormBloc
    extends Bloc<DeathCertificateFormEvent, DeathCertificateFormState> {
  DeathCertificateFormBloc() : super(DeathCertificateFormInitial()) {
    on<SubmitDeathCertificateFormEvent>(
        (SubmitDeathCertificateFormEvent event, Emitter emitter) async {
      emitter.call(SubmittingDeathCerificateFormState());
      try {
        await (await repository).create(DeathCertificate(
            -1,
            DeceasedInformation(
                event.deceasedFirstName,
                event.deceasedMiddleName,
                event.deceasedLastName,
                event.dateOfBirth,
                event.title,
                event.country,
                event.nationality,
                event.city,
                event.subcity,
                event.woreda,
                event.housenumber,
                event.dateOfDeath),
            CertificateDetail([], null, DateTime.now()),
            false));
        emitter.call(SubmittedDeathCertificateFormState());
      } catch (error) {
        log(error.toString());
        emitter.call(FailedSubmittingFormState(error as Error));

        emitter.call(DeathCertificateFormState);
      }
    });
  }

  Future<DeathCertificateRepository> get repository async {
    return await CoreInfrastractureProvider.provideDeathCertificateRepository();
  }
}
