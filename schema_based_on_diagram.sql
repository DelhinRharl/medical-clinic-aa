CREATE TABLE patients(
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(255),
date_of_birth date,
PRIMARY KEY (id)
);

CREATE TABLE invoices(
id INT GENERATED ALWAYS AS IDENTITY,
total_amount DECIMAL,
generated_at TIMESTAMP,
payed_at TIMESTAMP,
medical_histories_id INT,
PRIMARY KEY (id),
FOREIGN KEY (medical_histories_id) REFERENCES medical_histories (id)
);

CREATE TABLE medical_histories(
id INT GENERATED ALWAYS AS IDENTITY,
admitted_at TIMESTAMP,
patient_id INT,
status VARCHAR(255),
PRIMARY KEY (id),
FOREIGN KEY (patient_id) REFERENCES patients (id)
);

CREATE TABLE invoice_items(
id INT GENERATED ALWAYS AS IDENTITY,
unit_price DECIMAL,
quantity INT,
total_price DECIMAL,
invoice_id INT,
treatment_id INT,
PRIMARY KEY (id),
FOREIGN KEY (invoice_id) REFERENCES invoices (id),
FOREIGN KEY (treatment_id) REFERENCES treatments (id)
);


CREATE TABLE treatments(
id INT GENERATED ALWAYS AS IDENTITY,
type VARCHAR(255),
name VARCHAR(255),
PRIMARY KEY (id)
);

CREATE TABLE treatments_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    treatment_id INT,
    medical_histories_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (treatment_id) REFERENCES treatments (id),
    FOREIGN KEY (medical_histories_id) REFERENCES medical_histories (id)
);

CREATE INDEX treatment_index ON treatments_histories (treatment_id);
CREATE INDEX medical_index ON treatments_histories (medical_histories_id);