import 'package:admin_clinica_front/app/common/models/notification/notification_data_model.dart';
import 'package:admin_clinica_front/app/common/repository/notification/inotification_repository.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/data/repository/storage/ilocal_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState.initial()) {
    on<SendGroupNotifcationEvent>(sendGroupNotification);
  }
  final repository = locator.get<INotificationRepository>();
  final localRepository = locator.get<ILocalRepository>();
  Future<void> sendGroupNotification(SendGroupNotifcationEvent event, Emitter<NotificationState> emit) async {
    final resultUsuario = await localRepository.getUsuario();
    if (resultUsuario == null) {
      emit(const NotificationState.failure('Error al obtener datos del usuario'));
    }
    final request = event.request.copyWith(rol: resultUsuario!.rol);
    final result = await repository.sendGroupNotifcation(request);

    if (result.isLeft) {
      emit(NotificationState.failure(result.left));
    } else {
      // emit(NotificationState.success(result.right));
    }
  }
}
