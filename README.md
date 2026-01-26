# Medical Device Training System

## Project Overview

The Medical Device Training project aims to support traceability in the training and certification process of medical devices.
The system provides a digital solution that connects device-related risks, required skills, training materials, assessments, and trainee performance.

The main goal of the project is to ensure that all identified risks are properly addressed through structured training and evaluation.
By making relationships between risks, skills, and training activities visible, the system supports transparency and compliance in medical device training.



## System Description

The Medical Device Training System is a web-based application that supports role-based training management.
It allows administrators, trainers, and trainees to interact with the system according to their responsibilities.

The system focuses on traceability by linking risks to required skills and training materials, and by tracking trainee performance and assessment results.
This enables a clear overview of training coverage and helps verify whether all risks are sufficiently addressed.



## Main Features

* Role-based access for administrators, trainers, and trainees
* Traceability between risks, skills, training materials, and assessments
* Management of training content and trainee data
* Visualization of traceability relationships
* Performance tracking and result evaluation
* Report generation for training outcomes
* Web-based interface accessible through standard browsers



## System Architecture

The system is structured into several main components:

* **Frontend**
  Web-based user interface implemented using HTML, CSS, and JavaScript.
  Provides pages for login, user interaction, visualization, and result display.

* **Backend**
  Java-based server (`SimpleStaticServer.java`) that handles HTTP requests, serves frontend files, and manages data access logic.

* **Database**
  Stores user data, training materials, assessment results, and relationships between risks and skills.
  Database initialization is included in the project.

* **Deployment and Configuration**
  Configuration and startup files are provided to allow local execution of the system.

This modular structure supports separation of concerns and simplifies development and maintenance.



## Installation and Setup

### Prerequisites

Make sure the following software is installed:

* Java 8 or higher
* A modern web browser (Chrome, Edge, or Firefox)



### Running the System

1. Clone or download the project repository:

```
git clone https://github.com/YufengCai030114/Medical-Device-Training.git
```

2. Navigate to the project directory and compile the server:

```
javac SimpleStaticServer.java
```

3. Start the server:

```
java SimpleStaticServer http://localhost:8080
```

4. Open a web browser and access the system at:

```
http://localhost:8080
```



## Project Structure

```
Medical-Device-Training/
├── medtrain_first_part/     # Frontend (HTML, CSS, JavaScript)
├── db-init/                # Database initialization files
├── SimpleStaticServer.java # Backend server implementation
├── docker-compose.yml      # Deployment configuration
├── README.md               # Project documentation
└── .gitignore              # Git ignore configuration
```



## Team and Contributions

| Name          | Role                                  | Contribution                                                                                                                              |
| ------------- | ------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| Yufeng Cai    | Project Lead / Backend & Database     | Proposed the main system concept and architecture. Responsible for backend implementation, database design, and core technical decisions. |
| Gongcheng Sun | Frontend Development & Feature Design | Implemented system features and developed the frontend interface with a focus on usability and clear data visualization.                  |
| Jiayin Zhang  | Testing & Quality Assurance           | Conducted testing activities, supported code optimization, and contributed to quality assurance and project coordination.                 |



## Documentation and Evidence

Additional documentation is provided as part of the project submission, including:

* Project Management Documentation
* Evidence for Grading Criteria
* User Manual
* Installation Guide
* Individual Reflections

These documents describe the development process, project management approach, and evaluation criteria in detail.



## License

This project was developed for academic and educational purposes only.

© 2025
Yufeng Cai, Gongcheng Sun, Jiayin Zhang
