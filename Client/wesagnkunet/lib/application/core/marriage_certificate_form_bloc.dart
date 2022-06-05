import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wesagnkunet/domain/core/certificate.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/core/providers.dart';
import 'package:wesagnkunet/infrastructure/core/repositories.dart';

enum MarriageCertificateFormStatus { none, loading, done }

class MarriageCertificateFormState extends Equatable {
  MarriageCertificateFormStatus status;

  bool error;

  MarriageCertificateFormState(
      [this.status = MarriageCertificateFormStatus.none, this.error = false]);

  @override
  List<Object?> get props => [status, error];
}

class MarriageCertificateFormEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubmitForm extends MarriageCertificateFormEvent {
  String wifeFirstName,
      wifeMiddleName,
      wifeLastName,
      husbandFirstName,
      husbandMiddleName,
      husbandLastName;
  DateTime marriageDate;

  SubmitForm(
      this.wifeFirstName,
      this.wifeMiddleName,
      this.wifeLastName,
      this.husbandFirstName,
      this.husbandMiddleName,
      this.husbandLastName,
      this.marriageDate);
}

class MarriageCertificateFormBloc
    extends Bloc<MarriageCertificateFormEvent, MarriageCertificateFormState> {
  MarriageCertificateFormBloc() : super(MarriageCertificateFormState()) {
    on<SubmitForm>(_submitForm);
  }

  Future<MarriageCertificateRepository> get repository async {
    return await CoreInfrastractureProvider
        .provideMarriageCertificateRepository();
  }

  _submitForm(
      SubmitForm event, Emitter<MarriageCertificateFormState> emitter) async {
    emitter.call(
        MarriageCertificateFormState(MarriageCertificateFormStatus.loading));

    try {
      await (await repository).create(MarriageCertificate(
          -1,
          Spouse(
            event.wifeFirstName,
            event.wifeMiddleName,
            event.wifeLastName,
          ),
          Spouse(event.husbandFirstName, event.husbandMiddleName,
              event.husbandLastName),
          CertificateDetail([], null, DateTime.now()),
          event.marriageDate,
          false));

      emitter.call(
          MarriageCertificateFormState(MarriageCertificateFormStatus.done));
    } catch (e) {
      log(e.toString());

      emitter.call(MarriageCertificateFormState(
          MarriageCertificateFormStatus.none, true));
    }
  }
}
