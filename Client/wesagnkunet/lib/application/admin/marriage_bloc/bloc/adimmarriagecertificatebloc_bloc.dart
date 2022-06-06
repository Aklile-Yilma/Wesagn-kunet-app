import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/infrastructure/core/providers.dart';
import 'package:wesagnkunet/infrastructure/core/repositories.dart';
part 'adimmarriagecertificatebloc_event.dart';
part 'adimmarriagecertificatebloc_state.dart';

class AdminMarriageCertificateBloc extends Bloc<
    AdminMarriageCertificateBlocEvent, AdminMarriageCertificateBlocState> {
  AdminMarriageCertificateBloc() : super(AdimMarriageCertificateBlocInit()) {
    on<FetchMarriageCertificatesEvent>(
        (FetchMarriageCertificatesEvent event, Emitter emitter) async {

          log("Fetching Certificates");
      emitter.call(FetchingMarriageCertificatesState());

      try {
        List<MarriageCertificate> marriageCertificates =
            await (await repository).getAll(false);
        emitter.call(FetchedMarriageCertificatesState(
            marriageCertificates: marriageCertificates));
      } catch (error) {
        emitter.call(FetchMarriageCertificatesErrorsState(
            exception: error as Exception));
      }
    });

    on<GetSingleMarriageCertificateEvent>(
        (GetSingleMarriageCertificateEvent event, Emitter emitter) async {
      MarriageCertificate marriageCertificate;

      try {
        marriageCertificate =
            await (await repository).getById(event.certificateId);
        emitter.call(LoadedMarriageCertificateState(marriageCertificate));
      } catch (error) {
        emitter.call(
            LoadMarriageCertificateErrorState(exception: error as Exception));
      }
    });

    on<ApproveMarriageCertificateEvent>(
        (ApproveMarriageCertificateEvent event, Emitter emitter) async {
      try {
        final uprovedcertificate =
            await (await repository).verify(event.certificateId);

        emitter.call(ApprovedMarriageCertificteState(
            marriageCertificate: uprovedcertificate));
      } catch (error) {
        emitter.call(ApprovalError(error as Error));
      }
    });

    on<RejectMarriageCertificateEvent>(
        (RejectMarriageCertificateEvent event, Emitter emitter) async {
      try {
        final rejectedMarriageCertificate =
            await (await repository).verify(event.certificateId);
        emitter.call(
            RejectedMarriageCertificateState(rejectedMarriageCertificate));
      } catch (error) {
        emitter.call(RejectionError(error as Error));
      }
    });

    on<UpdateMarriageCertificateEvent>(
        (UpdateMarriageCertificateEvent event, Emitter emitter) async {
      try {
        final updatedMarriageCertificate =
            await (await repository).verify(event.certificateId);
        emitter.call(UpdatedMarriageCertificateState(
            marriageCertificate: updatedMarriageCertificate));
      } catch (error) {
        emitter.call(UpdateError(error as Error));
      }
    });

    on<DeleteMarriageCertificateEvent>(
        (DeleteMarriageCertificateEvent event, Emitter emitter) async {
      try {
        await (await repository).delete(event.certificateId);

        emitter.call(DeletedMarriageCertificateState());
      } catch (error) {
        emitter.call(DeletionError(exception: error as Exception));
      }
    });
  }

  Future<MarriageCertificateRepository> get repository async {
    return await CoreInfrastractureProvider
        .provideMarriageCertificateRepository();
  }
}
