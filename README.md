# AI-Powered Sepsis Detection System for ICU Patients

An enterprise-grade healthcare web application that performs real-time sepsis risk prediction for ICU patients using AI/ML with role-based access control.

## 🏥 Features

- **Real-Time Patient Monitoring**: Live vital signs, lab values, and ECG-style graphs
- **AI Sepsis Prediction**: XGBoost, Random Forest, Neural Networks, and Logistic Regression models
- **Explainable AI (SHAP)**: Feature contribution analysis and interpretability
- **Role-Based Access**: Doctor, Lab Technician, Nurse, Admin dashboards
- **Alert Management**: Real-time notifications with risk stratification
- **WebSocket Real-Time**: Continuous data streaming and updates
- **PDF Report Generation**: Professional hospital-grade reports
- **Audit Logging**: Complete system activity tracking
- **Dark/Light Mode**: Modern UI with Glassmorphism effects

## 🛠 Tech Stack

### Frontend
- React.js + Next.js + TypeScript
- Tailwind CSS + ShadCN UI
- Framer Motion + Recharts
- Socket.IO Client

### Backend
- FastAPI + Python
- Socket.IO + WebSockets
- JWT Authentication + bcrypt
- SQLAlchemy ORM

### Database
- PostgreSQL

### AI/ML
- Scikit-Learn + XGBoost
- TensorFlow/Keras
- SHAP Explainability

### Deployment
- Docker + Docker Compose

## 📋 User Roles

1. **Doctor**: Patient management, predictions, prescriptions, alerts
2. **Lab Technician**: Patient records, lab reports, vital signs
3. **Nurse**: Prescriptions, medication schedules, alerts
4. **Admin**: User management, system monitoring, audit logs

## 🚀 Quick Start

### Prerequisites
- Docker & Docker Compose
- Node.js 18+ (for local development)
- Python 3.10+ (for local development)
- PostgreSQL 15+ (for local development)

### Installation

1. Clone the repository
```bash
git clone https://github.com/Sinchana984/sepsis-detection-icu.git
cd sepsis-detection-icu
```

2. Build and run with Docker Compose
```bash
docker-compose up -d
```

3. Access the application
- Frontend: http://localhost:3000
- API Docs: http://localhost:8000/docs
- Database: localhost:5432

### Local Development

**Backend Setup**
```bash
cd backend
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
python main.py
```

**Frontend Setup**
```bash
cd frontend
npm install
npm run dev
```

## 📁 Project Structure

```
sepsis-detection-icu/
├── frontend/                 # Next.js frontend application
├── backend/                  # FastAPI backend
├── database/                 # Database schemas
├── ml_models/                # Pre-trained AI models
├── docker-compose.yml
└── docs/                     # Documentation
```

## 🔐 Security

- JWT-based authentication
- Password hashing with bcrypt
- Role-based access control (RBAC)
- SQL injection prevention
- Audit logging
- Session timeout management

## 📈 AI Models

- **XGBoost** (AUC: 0.92)
- **Random Forest** (AUC: 0.88)
- **Neural Network** (AUC: 0.90)
- **Logistic Regression** (AUC: 0.84)

---

**Built with ❤️ for healthcare professionals**
