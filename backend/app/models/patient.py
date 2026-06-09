from sqlalchemy import Column, Integer, String, Float, DateTime, Text, Enum
from datetime import datetime
import enum
from app.database import Base

class PatientStatus(str, enum.Enum):
    ADMITTED = "admitted"
    UNDER_OBSERVATION = "under_observation"
    RECOVERING = "recovering"
    DISCHARGED = "discharged"

class Patient(Base):
    __tablename__ = "patients"
    
    id = Column(Integer, primary_key=True, index=True)
    patient_id = Column(String, unique=True, index=True)
    first_name = Column(String)
    last_name = Column(String)
    age = Column(Integer)
    gender = Column(String)
    blood_group = Column(String)
    weight = Column(Float)
    height = Column(Float)
    icu_bed_number = Column(String)
    admission_date = Column(DateTime, default=datetime.utcnow)
    status = Column(Enum(PatientStatus), default=PatientStatus.ADMITTED)
    medical_history = Column(Text)
    created_at = Column(DateTime, default=datetime.utcnow)