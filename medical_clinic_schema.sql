CREATE TABLE patients(
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR,
date_of_birth date,
);

CREATE TABLE invoices(
id INT GENERATED ALWAYS AS IDENTITY,
total_amount DECIMAL,
generated_at TIMESTAMP,
payed_at TIMESTAMP,
medical_history_id INT,
);

CREATE TABLE medical_history(
id INT GENERATED ALWAYS AS IDENTITY,
admitted_at TIMESTAMP,
patient_id INT,
status VARCHAR,
);

CREATE TABLE invoice_items(
id INT GENERATED ALWAYS AS IDENTITY,
unit_price DECIMAL,
quantity INT,
total_price DECIMAL,
invoice_id INT,
treatment_id INT,
);


CREATE TABLE treatments(
id INT GENERATED ALWAYS AS IDENTITY,
type VARCHAR,
name VARCHAR,
);