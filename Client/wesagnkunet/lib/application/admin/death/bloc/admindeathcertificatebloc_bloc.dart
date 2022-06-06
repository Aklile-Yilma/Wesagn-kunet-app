import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wesagnkunet/infrastructure/core/providers.dart';
import 'package:wesagnkunet/infrastructure/core/repositories.dart';

import '../../../../domain/core/death_certificates.dart';
import '../../../../domain/core/marriage_certificate.dart';

part 'admindeathcertificatebloc_event.dart';
part 'admindeathcertificatebloc_state.dart';

class AdminDeathCertificateBloc extends Bloc<AdminDeathCertificateBlocEvent,
    AdminDeathCertificateBlocState> {
  AdminDeathCertificateBloc() : super(AdminDeathCertificateBlocInitial()) {
    on<FetchDeathCertificatesEvent>(
        (FetchDeathCertificatesEvent event, Emitter emitter) async {
      emitter.call(FetchingDeathCertificatesState());

      try {
        List<DeathCertificate> deathCertificates =
            await (await repository).getAll();
        emitter.call(FetchedDeathCertificatesState(
            deathCertificates: deathCertificates));
      } catch (error) {
        emitter.call(
            FetchDeathCertificatesErrorsState(exception: error as Exception));
      }
    });

    on<GetSingleDeathCertificateEvent>(
        (GetSingleDeathCertificateEvent event, Emitter emitter) async {
      DeathCertificate deathCertificate;

      try {
        deathCertificate =
            await (await repository).getById(event.certificateId);
        emitter.call(LoadedDeathCertificateState(deathCertificate));
      } catch (error) {
        emitter.call(
            LoadDeathCertificateErrorState(exception: error as Exception));
      }
    });

    on<ApproveDeathCertificateEvent>(
        (ApproveDeathCertificateEvent event, Emitter emitter) async {
      try {
        final uprovedcertificate =
            await (await repository).verify(event.certificateId);

        emitter.call(
            ApprovedDeathCertificteState(deathCertificate: uprovedcertificate));
      } catch (error) {
        emitter.call(ApprovalError(error as Error));
      }
    });

    on<RejectDeathCertificateEvent>(
        (RejectDeathCertificateEvent event, Emitter emitter) async {
      try {
        final rejectedDeathCertificate =
            await (await repository).verify(event.certificateId);
        emitter.call(RejectedDeathCertificateState(rejectedDeathCertificate));
      } catch (error) {
        emitter.call(RejectionError(error as Error));
      }
    });

    on<UpdateDeathCertificateEvent>(
        (UpdateDeathCertificateEvent event, Emitter emitter) async {
      try {
        final updatedDeathCertificate =
            await (await repository).verify(event.certificateId);
        emitter.call(UpdatedDeathCertificateState(
            deathCertificate: updatedDeathCertificate));
      } catch (error) {
        emitter.call(UpdateError(error as Error));
      }
    });

    on<DeleteDeathCertificateEvent>(
        (DeleteDeathCertificateEvent event, Emitter emitter) async {
      try {
        await (await repository).delete(event.certificateId);

        emitter.call(DeletedDeathCertificateState());
      } catch (error) {
        emitter.call(DeletionError(exception: error as Exception));
      }
    });
  }

  Future<DeathCertificateRepository> get repository async {
    return await CoreInfrastractureProvider.provideDeathCertificateRepository();
  }
}
