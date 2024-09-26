part of 'doctor_update_bloc.dart';

@freezed
class DoctorUpdateEvent with _$DoctorUpdateEvent {
  factory DoctorUpdateEvent.getDoctor(int id) = GetDoctor;
  factory DoctorUpdateEvent.updateDoctor(DoctorUpdateViewModel doctorUpdateView) = DoctorUpdatedEvent;
}
