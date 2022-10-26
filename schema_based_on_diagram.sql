CREATE TABLE patients (
	id int primary key generated always as identity,
  name varchar,
	date_of_birth date
);

CREATE TABLE invoices (
	id int primary key generated always as identity,
  generated_at timestamp,
  payed_at timestamp,
	medical_history_id decimal,	

  CONSTRAINT medical_history_id_fkey FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE medical_histories (
	id in primary key generated always as identity,
  admitted_at timestamp,
	patient_id int,
	status varchar,

  CONSTRAINT patient_id_fkey FOREIGN KEY(patient_id) REFERENCES patients(id)
);

CREATE TABLE invoices_items (
	id int primary key generated always as identity,
  unit_price decimal,
  quantity int,
  total_price decimal,
  invoice_id int,
  treatment_id int,

  CONSTRAINT invoice_id_fkey FOREIGN KEY(invoice_id) REFERENCES invoices(id),
  CONSTRAINT treatment_id_fkey FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);

CREATE TABLE treatments(
    id int primary key generated always as identity,
    type varchar,
    name varchar
);

CREATE TABLE medical_histories_join_treatments(                                              
    id int primary key generated always as identity,
    histories_id int,
    treatment_id int,

    CONSTRAINT medical_history_id_fkey FOREIGN KEY(histories_id) REFERENCES medical_histories(id),
    CONSTRAINT treatments_id_fkey FOREIGN KEY(treatment_id) REFERENCES treatments(id),
)

CREATE INDEX invoice_items_invoice_id ON invoices_items(invoice_id);
CREATE INDEX medical_histories_patient_id ON medical_histories(patient_id);
CREATE INDEX medical_histories_join_treatments_histories_id ON medical_histories_join_treatments(histories_id);
CREATE INDEX medical_histories_join_treatments_treatment_id ON medical_histories_join_treatments(treatment_id);
CREATE INDEX invoices_medical_history_id ON invoices(medical_history_id);
CREATE INDEX invoice_items_treatment_id ON invoices_items(treatment_id);
