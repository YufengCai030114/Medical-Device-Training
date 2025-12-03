# 1. Project Overview

The **Medical Device Training System** is a web-based platform designed to enhance **traceability**, **training effectiveness**, and **risk–skill linkage** in medical device education.  
The system connects **device risks → required skills → training materials → assessments → trainee performance**, ensuring that every risk is covered by relevant training activities.

---

# 2. Team Members & Responsibilities

| Member | Role | Responsibilities |
|--------|-------|------------------|
| **Yu'feng Cai** | Frontend Developer | UI implementation, page design, API connection |
| **Gongcheng Sun** | Backend Developer & Graph Module Lead | API design, database schema, risk–skill graph, login/register |
| **Jiayin Zhang** | Documentation & Testing | README writing, test cases, workflow documentation, bug reporting |

---

# 3. Detailed Time Tracking (Estimation + Actual Time)

## 3.1 Time Tracking Table

| Member | Task | Date | Estimated (h) | Actual (h) | Status | Notes |
|--------|------|--------|----------------|-------------|---------|--------|
| **Yu'feng Cai** | UI layout setup | 2025-11-09 | 2.0 | 2.3 | Done | Initial framework |
| Cai | UI refinement & bug fixes | 2025-11-10 | 1.5 | 1.7 | Done | Alignment fixed |
| Cai | Frontend → Backend API integration | 2025-11-11 | 2.0 | 2.4 | Done | Login flow |

| **Gongcheng Sun** | Database schema design | 2025-11-09 | 2.0 | 2.2 | Done | User & training tables |
| Sun | API endpoint implementation | 2025-11-10 | 2.5 | 2.7 | Done | REST endpoints |
| Sun | Risk–Skill Graph development | 2025-11-11 | 2.0 | 2.6 | Done | Visualization logic |

| **Jiayin Zhang** | Initial documentation | 2025-11-09 | 1.5 | 1.8 | Done | Base README |
| Zhang | Test cases (login) | 2025-11-10 | 2.0 | 2.1 | Done | Functional tests |
| Zhang | Documentation improvement | 2025-11-11 | 2.0 | 2.4 | Done | Added workflow and tables |

---

## 3.2 Total Hours Summary

| Member | Estimated (h) | Actual (h) |
|--------|----------------|-------------|
| **Yu'feng Cai** | 5.5 | 6.4 |
| **Gongcheng Sun** | 6.5 | 7.5 |
| **Jiayin Zhang** | 5.5 | 6.3 |

**Total Actual Hours: 20.2h**

---

# 4. Sprint Work Plan

## 4.1 Completed Tasks (Sprint 1)
- Implement login page UI (Cai)  
- Connect frontend with backend API (Cai & Sun)  
- Design database schema (Sun)  
- Implement link editor (Sun)  
- Create basic risk–skill graph (Sun)  
- Write test cases for login feature (Zhang)  
- Draft and refine documentation (Zhang)  

## 4.2 Sprint 2 Goals
- Improve graph visualization (clearer, more complex relationships)  
- Complete login & register workflow with different user roles  
- Implement trainee/trainer dashboards  
- Add training materials module  
- Improve traceability dashboard  

---

# 5. System Features

1. Training content management  
2. Risk–skill linkage with graph visualization  
3. Role-based access control (trainer / trainee)  
4. Performance tracking & reporting  
5. Persistent backend database  
6. Browser-accessible web interface  

---

# 6. System Architecture

## 6.1 Architecture Description
- **Frontend**: HTML/CSS/JS  
- **Backend**: Java server (`SimpleStaticServer.java`)  
- **Database**: MySQL / SQLite  
- **Graph Module**: Visualizes risk–skill connections  
## 6.2 System Architecture Diagram

The architecture of the system follows a simple structure as discussed with the supervisor.  
The main focus is to clearly show how risks and skills are connected and how this information flows through the system.  
The system consists of four main components:

1. **Frontend UI**  
   - Provides the dashboard, editor, and the graph interface.  
   - Sends user operations (e.g., adding risks, linking skills) to the backend.

2. **Backend Java Server**  
   - Processes incoming requests from the frontend.  
   - Handles logic such as creating links, retrieving risks and skills, and preparing data for visualization.  
   - Communicates with both the database and the graph module.

3. **Database**  
   - Stores users, risks, skills, and risk–skill link data.  
   - Ensures that all traceability data remains consistent.

4. **Graph Module**  
   - Generates the risk–skill connection data structure based on backend queries.  
   - Provides formatted graph data that the frontend can render visually.

```mermaid
flowchart LR
    FE[Frontend UI] --> BE[Backend Java Server]

    BE --> DB[(Database)]
    BE --> GM[Graph Module]

    GM --> FE

## 6.3 Backend Logic Flow

The backend logic follows a simple and clear workflow, ensuring that every action performed in the frontend is processed consistently:

1. The frontend sends a request (e.g., create link, load risks, load skills).
2. The Java backend receives the request and validates the parameters.
3. Depending on the operation, the backend queries or updates the database.
4. For traceability, the backend collects all related risks, skills, and link records.
5. The backend generates structured JSON data (e.g., for the graph view).
6. The response is returned to the frontend, which updates the interface immediately.

This workflow ensures that all risk–skill relationships remain traceable and up-to-date.

---

## 6.4 Data Model Overview

The system uses a minimal relational database structure that supports the required traceability between risks and skills.

### 6.4.1 Users Table
- `id`
- `username`
- `password_hash`
- `role` (trainer / trainee)

### 6.4.2 Risks Table
- `risk_id`
- `description`

### 6.4.3 Skills Table
- `skill_id`
- `description`

### 6.4.4 RiskSkillLinks Table
- `link_id`
- `risk_id` (foreign key → Risks)
- `skill_id` (foreign key → Skills)

This table represents the many-to-many relationship between risks and skills, forming the core of the traceability chain.

### 6.4.5 TrainingMaterials Table (optional extension)
- `material_id`
- `skill_id`
- `file_path` or `url`

---

## 6.5 API Overview

The Java backend exposes lightweight API endpoints that allow the frontend to retrieve and update data.

| Endpoint        | Method | Description |
|-----------------|--------|-------------|
| `/login`        | POST   | Authenticate user credentials |
| `/risk/list`    | GET    | Retrieve all risks |
| `/skill/list`   | GET    | Retrieve all skills |
| `/link/create`  | POST   | Create a new risk–skill link |
| `/graph/data`   | GET    | Return JSON structure for graph visualization |

These endpoints support all core interactions of the system and enable the traceability workflow defined in the project requirements.
