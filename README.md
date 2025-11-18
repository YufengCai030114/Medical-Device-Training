# Medical-Device-Training
The Medical Device Training project aims to develop a digital tool that enhances traceability in the training and certification process of medical devices. The system connects risks, required skills, training materials, assessments, and trainee performance, ensuring that all identified risks are properly addressed through training and evaluation.
# Medical Device Training System

The Medical Device Training System is a web-based platform designed to enhance traceability and efficiency in the training and certification process of medical devices.  
It connects device-related risks, required skills, training materials, and trainee performance, ensuring that all identified risks are properly addressed through structured training and evaluation.
## Team Members & Task Assignment

| Member         | Role / Responsibility   | Description of Work                            | Status     |
|----------------|-------------------------|-----------------------------------------------|------------|
| Yu'feng Cai    | Frontend Development    | Page layout, UI implementation, component logic | In Progress |
| Gongcheng Sun  | Backend Development     | API design, database schema, deployment        | In Progress |
| Jiayin Zhang   | Documentation & Testing | Writing README, test cases, bug reports        | Completed  |

---

##  Time Tracking Summary

| Member         | Task                                | Date       | Hours | Status     | Notes                     |
|----------------|--------------------------------------|------------|-------|------------|---------------------------|
| Yu'feng Cai    | Backend database schema             | 2025-11-10 | 3.5     | Completed  | Finished initial UI       |
| Yu'feng Cai    | UI bug fixes                         | 2025-11-11 | 2     | Completed  | Minor adjustments         |
| Gongcheng Sun  | Frontend UI implementation          | 2025-11-10 | 3     | Completed  | Set up DB structure       |
| Gongcheng Sun  | API endpoint development             | 2025-11-11 | 2.5     | Completed  | Added main API features   |
| Jiayin Zhang   | Documentation writing                | 2025-11-10 | 3     | Completed  | Initial structure         |
| Jiayin Zhang   | Documentation improvements           | 2025-11-11 | 2.5   | Completed  | Added assignment sections |

## Work Plan (Task List)


- [x] Implement user login page (Yu'feng Cai)
- [x] Connect frontend to backend API (Yu'feng Cai & Gongcheng Sun)
- [x] Design database schema for user data (Gongcheng Sun)
- [x] Write test cases for login feature (Jiayin Zhang)
- [x] Polish README and project documentation (Jiayin Zhang)

## Features

- Digital training management: organize and track training sessions and certifications  
- Traceability between risks, skills, and training materials  
- Role-based system for administrators, trainers, and trainees  
- Performance tracking and reporting  
- Database integration for persistent data management  
- Web-based interface accessible through browsers  

---


## System Architecture


- **Frontend:** Interactive web pages served to users  
- **Backend:** Java server (`SimpleStaticServer.java`) handles HTTP requests and serves data  
- **Database:** Stores users, training materials, results, and risk links  

---

## Installation and Setup

### Prerequisites
Make sure you have:
- **Java 8+** installed  
- **A web browser** (Chrome, Edge, or Firefox)  
- *(Optional)* A database installed (MySQL or SQLite)

### Steps

1. Clone or download this repository:
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
## Team and Contribution

| Name | Role | Description |
|------|------|-------------|
| Yufeng Cai | Developer | System design, backend implementation |
| Gongcheng Sun | Developer | Frontend development, database design |
| Jiayin Zhang | Developer | Interface optimization, documentation |

---

## License

This project is developed for **academic and educational purposes** only.  
All rights reserved © 2025 Yufeng Cai, Gongcheng Sun, and Jiayin Zhang.
