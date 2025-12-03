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

```mermaid
flowchart LR
    FE[Frontend UI<br/>Dashboard / Editor / Graph] --> BE[Backend Java Server<br/>Logic + API]

    BE --> DB[(Database<br/>Users / Risks / Skills / Links)]
    BE --> GM[Graph Module<br/>Generate Risk-Skill Data]

    GM --> FE
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
   - Ensures that all traceability information is kept consistently.

4. **Graph Module**  
   - Generates the risk–skill connection data structure based on backend queries.  
   - Provides formatted graph data that the frontend can render visually.

This architecture clearly shows how data flows through the system and supports the traceability requirement emphasized by the supervisor.

### Architecture Diagram

```mermaid
flowchart LR
    FE[Frontend UI\nDashboard]()

