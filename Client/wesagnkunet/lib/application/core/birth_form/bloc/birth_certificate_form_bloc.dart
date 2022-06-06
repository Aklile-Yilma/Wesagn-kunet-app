import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wesagnkunet/domain/core/birth_certificate.dart';
import 'package:wesagnkunet/domain/core/certificate.dart';
import 'package:wesagnkunet/infrastructure/core/providers.dart';
import 'package:wesagnkunet/infrastructure/core/repositories.dart';

part 'birth_certificate_form_event.dart';
part 'birth_certificate_form_state.dart';

class BirthCertificateFormBloc
    extends Bloc<BirthCertificateFormEvent, BirthCertificateFormState> {
  BirthCertificateFormBloc() : super(BirthCertificateFormInitial()) {
    on<SubmiteBirthCertificateFormEvent>(
        (SubmiteBirthCertificateFormEvent event, Emitter emitter) async {
      emitter.call(SubmittingBirthCertificateFormState());
      try {
        await (await repository).create(BirthCertificate(
            -1,
            Child(event.childFirstName, event.childMiddleName,
                event.childLastName),
            ParentInformation(event.fatherFirstName, event.fatherMiddleName,
                event.fatherLastName),
            ParentInformation(event.motherFirstName, event.motherMiddleName,
                event.motherLastName),
            CertificateDetail([], null, DateTime.now()),
            "MALE",
            event.dateOfBirth,
            false));
        emitter.call(SubmittedBirthCertificateFormState());
      } catch (error) {
        log(error.toString());
        emitter.call(FailedToSubmitForm(error as Error));
        emitter.call(BirthCertificateFormState);
      }
    });
  }

  Future<BirthCertificateRepository> get repository async {
    return await CoreInfrastractureProvider.provideBirthCertificateRepository();
  }
}
