# Medical-Device-Training
The Medical Device Training project aims to develop a digital tool that enhances traceability in the training and certification process of medical devices. The system connects risks, required skills, training materials, assessments, and trainee performance, ensuring that all identified risks are properly addressed through training and evaluation.
# 🏥 Medical Device Training System

The **Medical Device Training System** is a web-based platform designed to enhance traceability and efficiency in the **training and certification process of medical devices**.  
It connects device-related risks, required skills, training materials, and trainee performance — ensuring that all identified risks are properly addressed through structured training and evaluation.

---

## 🚀 Features

- **Digital training management** – organize and track training sessions and certifications  
- **Traceability** – link training materials, assessments, and skills to device-related risks  
- **Role-based system** – separate interfaces for administrators, trainers, and trainees  
- **Performance tracking** – monitor trainee progress and assessment results  
- **Database integration** – store and manage training data persistently  
- **Web-based interface** – access the system directly through a browser  

---

## 🧩 System Architecture


- **Frontend:** Interactive web pages served to users  
- **Backend:** Java server (`SimpleStaticServer.java`) handles HTTP requests and serves data  
- **Database:** Stores users, training materials, results, and risk links  

---

## ⚙️ Installation & Setup

### Prerequisites
Make sure you have:
- **Java 8+** installed  
- **A web browser** (Chrome / Edge / Firefox)  
- *(Optional)* A database installed (MySQL / SQLite)

### Steps

1. **Clone or download** this repository  
   ```bash
   git clone https://github.com/YufengCai030114/Medical-Device-Training.git
javac SimpleStaticServer.java
java SimpleStaticServer
http://localhost:8080
Medical-Device-Training/
├── .idea/                      # IDE configuration files
├── medtrain_first_part/        # Frontend (HTML, CSS, JS)
├── out/                        # Compiled output
├── SimpleStaticServer.java     # Backend server file
├── README.md                   # Project documentation
└── .gitignore                  # Git ignored files list
## 👥 Team & Contribution

| Name | Role | Description |
|------|------|-------------|
| **Yufeng Cai** | Developer | System design, backend implementation |
| **Gongcheng Sun** | Developer | Frontend development, database design |
| **Jiayin Zhang** | Developer | Interface optimization, documentation |

---

## 🧾 License

This project is developed for **academic and educational purposes** only.  
All rights reserved © 2025 Yufeng Cai, Gongcheng Sun, and Jiayin Zhang.
