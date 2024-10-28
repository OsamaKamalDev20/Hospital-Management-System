// Enum to represent appointment status
enum AppointmentStatus { scheduled, completed, cancelled }

// Enum to represent patient status
enum PatientStatus { admitted, discharge, underObservation }

// Abstract base class for Person
abstract class Person {
  String name;
  int age;
  String contactNumber;

  Person(this.name, this.age, this.contactNumber);

  void displayDetails();
}

// Doctor class inheriting from Person
class Doctor extends Person {
  String specialization;

  Doctor(String name, int age, String contactNumber, this.specialization)
      : super(name, age, contactNumber);

  @override
  void displayDetails() {
    print(
      "Doctor Name: $name, Age: $age, Contact No: $contactNumber, Specialization: $specialization",
    );
  }
}

// Patient class inheriting from Person
class Patient extends Person {
  PatientStatus status;

  Patient(String name, int age, String contactNumber)
      : status = PatientStatus.underObservation,
        super(name, age, contactNumber);

  @override
  void displayDetails() {
    print(
      "Patient Name: $name, Age: $age, Contact No: $contactNumber, Patient Status: $status",
    );
  }
}

// Appointment class to manage the scheduling of appointments
class Appointment {
  Doctor doctor;
  Patient patient;
  DateTime dateTime;
  AppointmentStatus status;

  Appointment(this.doctor, this.patient, this.dateTime)
      : status = AppointmentStatus.scheduled;

  void markAsComplete() {
    status = AppointmentStatus.completed;
    print("");
    print(
      "Appointment with Dr. ${doctor.name} for patient ${patient.name} is marked as completed.",
    );
  }

  void cancelAppointment() {
    status = AppointmentStatus.cancelled;
    print("");
    print(
      "Appointment with Dr. ${doctor.name} for patient ${patient.name} has been cancelled",
    );
  }

  void displayAppointmentDetails() {
    print("");
    print(
      "Appointment - Doctor: ${doctor.name}, Patient Name: ${patient.name}, Date: $dateTime, Status: $status",
    );
  }
}

// MedicalRecord class to store the patient's medical details
class MedicalRecord {
  Patient patient;
  String diagnosis;
  List<String> treatments;

  MedicalRecord(this.patient, this.diagnosis, this.treatments);

  void displayMedicalRecords() {
    print(
      "Medical Record for ${patient.name} - Diagnosis: $diagnosis, Treatment: ${treatments.join(', ')}",
    );
  }
}

// HospitalManagement class to manage all operations of the hospital
class HospitalManagement {
  List<Doctor> doctors = [];
  List<Patient> patients = [];
  List<Appointment> appointments = [];
  List<MedicalRecord> medicalRecords = [];

  void addDoctor(Doctor doctor) {
    doctors.add(doctor);
    print("");
    print("Doctor: ${doctor.name} added to the hospital.");
  }

  void addPatient(Patient patient) {
    patients.add(patient);
    print("");
    print("Patient: ${patient.name} added to the hospital.");
  }

  void scheduleAppointment(Doctor doctor, Patient patient, DateTime dateTime) {
    Appointment appointment = Appointment(doctor, patient, dateTime);
    appointments.add(appointment);
    print("");
    print(
      "Appointment schedule with Dr. ${doctor.name} for Patient: ${patient.name} is schedule on $dateTime",
    );
  }

  void addMedicalRecord(
      Patient patient, String diagnosis, List<String> treatments) {
    MedicalRecord medicalRecord = MedicalRecord(patient, diagnosis, treatments);
    medicalRecords.add(medicalRecord);
    print("");
    print(
      "Medical Record for Patient: ${patient.name} added to Hospital Records",
    );
  }

  void displayAllPatients() {
    print("");
    print("\n -------------  List of Patients -------------");
    print("");
    for (var patient in patients) {
      patient.displayDetails();
    }
  }

  void displayAllDoctors() {
    print("");
    print("\n -------------  List of Doctors -------------");
    print("");
    for (var doctor in doctors) {
      doctor.displayDetails();
    }
  }

  void displayAllAppointments() {
    print("");
    print("\n------------- List of Appointments -------------");
    print("");
    for (var appointment in appointments) {
      appointment.displayAppointmentDetails();
    }
  }

  void displayAllMedicalRecords() {
    print("");
    print("\n------------- List of Medical Records -------------");
    print("");
    for (var record in medicalRecords) {
      record.displayMedicalRecords();
    }
  }
}

void main() {
  print("");
  print("-------------  Hospital Management System -------------");
  print("");
  // Hospital Management System Initialization
  HospitalManagement hospital = HospitalManagement();

  // Adding doctors to the hospital
  hospital.addDoctor(
    Doctor("Nadir Ali Syed", 40, "021-111724000", "Neurologist"),
  );
  hospital.addDoctor(
    Doctor("Prof. S.M Wasim Jafri", 55, "021-111724000", "Gastroenterologist"),
  );
  hospital.addDoctor(
    Doctor("Syeda Shahmona", 30, "021-111724000", "Dermatologist"),
  );
  hospital.addDoctor(
    Doctor("Amna Tariq", 40, "021-111724000", "Child Psychologist"),
  );

// Adding patients to the hospital
  hospital.addPatient(
    Patient(
      "Shahid Aslam",
      47,
      "0323-4500087",
    ),
  );
  hospital.addPatient(
    Patient(
      "Mrs Parveen Akhtar",
      67,
      "0322-8047730",
    ),
  );
  hospital.addPatient(
    Patient(
      "Maria Ejaz",
      31,
      "0305-8252525",
    ),
  );
  hospital.addPatient(
    Patient(
      "Nimrah Jalal",
      37,
      "0332-5877775",
    ),
  );

// Display all doctors in the hospital
  hospital.displayAllDoctors();

// Display all patients in the hospital
  hospital.displayAllPatients();

// Scheduling appointments
  hospital.scheduleAppointment(
    hospital.doctors[2],
    hospital.patients[3],
    DateTime.now().add(
      Duration(days: 3),
    ),
  );
  hospital.scheduleAppointment(
    hospital.doctors[3],
    hospital.patients[1],
    DateTime.now().add(
      Duration(days: 4),
    ),
  );
  hospital.scheduleAppointment(
    hospital.doctors[0],
    hospital.patients[2],
    DateTime.now().add(
      Duration(days: 6),
    ),
  );

  // Display all appointments
  hospital.displayAllAppointments();

  // Adding medical records for patients
  hospital.addMedicalRecord(
    hospital.patients[2],
    "Lung Cancer",
    ["Targeted Therapy', 'Radiation Therapy"],
  );
  hospital.addMedicalRecord(
    hospital.patients[1],
    "Blood Cancer",
    ["Chemotherapy", "Stem Cell Transplant"],
  );
  hospital.addMedicalRecord(
    hospital.patients[0],
    "Hypertension",
    ["Medication", "Lifestyle Change"],
  );

  // Display all medical records
  hospital.displayAllMedicalRecords();

  // Mark an appointment as completed
  hospital.appointments[2].markAsComplete();
  hospital.appointments[1].cancelAppointment();
  hospital.displayAllAppointments();
}
