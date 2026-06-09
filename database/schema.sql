CREATE TABLE IF NOT EXISTS users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  full_name VARCHAR(255) NOT NULL,
  hashed_password VARCHAR(255) NOT NULL,
  role VARCHAR(50) NOT NULL DEFAULT 'doctor',
  department VARCHAR(255),
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  last_login TIMESTAMP NULL
);

CREATE TABLE IF NOT EXISTS patients (
  id SERIAL PRIMARY KEY,
  patient_id VARCHAR(255) UNIQUE NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  age INTEGER NOT NULL,
  gender VARCHAR(50),
  blood_group VARCHAR(10),
  weight FLOAT,
  height FLOAT,
  icu_bed_number VARCHAR(50),
  admission_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  discharge_date TIMESTAMP NULL,
  status VARCHAR(50) DEFAULT 'admitted',
  medical_history TEXT,
  current_diagnosis TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS vital_signs (
  id SERIAL PRIMARY KEY,
  patient_id INTEGER NOT NULL REFERENCES patients(id),
  heart_rate FLOAT,
  systolic_bp FLOAT,
  diastolic_bp FLOAT,
  respiratory_rate FLOAT,
  temperature FLOAT,
  oxygen_saturation FLOAT,
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS lab_values (
  id SERIAL PRIMARY KEY,
  patient_id INTEGER NOT NULL REFERENCES patients(id),
  wbc_count FLOAT,
  rbc_count FLOAT,
  hemoglobin FLOAT,
  hematocrit FLOAT,
  platelet_count FLOAT,
  glucose FLOAT,
  creatinine FLOAT,
  bun FLOAT,
  bilirubin FLOAT,
  lactate FLOAT,
  ph FLOAT,
  pco2 FLOAT,
  po2 FLOAT,
  bicarbonate FLOAT,
  albumin FLOAT,
  prothrombin_time FLOAT,
  test_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  notes TEXT
);

CREATE TABLE IF NOT EXISTS sepsis_predictions (
  id SERIAL PRIMARY KEY,
  patient_id INTEGER NOT NULL REFERENCES patients(id),
  risk_score FLOAT NOT NULL,
  risk_level VARCHAR(50),
  model_used VARCHAR(100),
  confidence FLOAT,
  feature_importance JSONB,
  top_factors JSONB,
  probability FLOAT,
  prediction_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS prescriptions (
  id SERIAL PRIMARY KEY,
  patient_id INTEGER NOT NULL REFERENCES patients(id),
  doctor_id INTEGER NOT NULL REFERENCES users(id),
  medication_name VARCHAR(255),
  dosage VARCHAR(100),
  frequency VARCHAR(100),
  duration VARCHAR(100),
  instructions TEXT,
  start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  end_date TIMESTAMP NULL,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS audit_logs (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  action VARCHAR(255),
  resource_type VARCHAR(100),
  resource_id INTEGER,
  details JSONB,
  ip_address VARCHAR(45),
  user_agent TEXT,
  status VARCHAR(50),
  timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_patients_patient_id ON patients(patient_id);
CREATE INDEX idx_vital_signs_patient_id ON vital_signs(patient_id);
CREATE INDEX idx_lab_values_patient_id ON lab_values(patient_id);
CREATE INDEX idx_sepsis_predictions_patient_id ON sepsis_predictions(patient_id);
CREATE INDEX idx_prescriptions_patient_id ON prescriptions(patient_id);
CREATE INDEX idx_audit_logs_user_id ON audit_logs(user_id);
CREATE INDEX idx_audit_logs_timestamp ON audit_logs(timestamp);