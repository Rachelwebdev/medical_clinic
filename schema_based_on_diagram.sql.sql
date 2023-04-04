CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(250),
    date_of_birth DATE,
)

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at TIMESTAMP,
    CONSTRAINT fk_patients FOREIGN KEY(patient_id) REFERENCES patients(id),
    status VARCHAR(250)
)

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    CONSTRAINT fk_medical_histories FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
)

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    CONSTRAINT fk_invoices FOREIGN KEY(invoice_id) REFERENCES invoices(id),
    CONSTRAINT fk_treatments FOREIGN KEY(treatment_id) REFERENCES treatments(id)      
)

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(250),
    name VARCHAR(250)
)

CREATE TABLE medical_history_treatments (
    id SERIAL PRIMARY KEY,
    medical_history_id INT NOT NULL,
    treatment_id INT NOT NULL,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id),
    FOREIGN KEY (treatment_id) REFERENCES treatments (id)
);


CREATE INDEX ON medical_history_treatments (medical_history_id);

CREATE INDEX ON medical_history_treatments (treatment_id);