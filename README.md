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

The system follows a **simple three-layer architecture**, which matches the project scope and the teacher’s expectations:

1. **Frontend (Browser UI)**  
   - Displays pages such as login, dashboard, risk–skill graph, and training editor.  
   - Sends/receives data using HTTP requests.

2. **Backend (Java Server)**  
   - Handles all logic: data processing, risk–skill linking, and graph data generation.  
   - Provides endpoints for fetching risks, skills, and connection information.

3. **Database (MySQL/SQLite)**  
   - Stores users, risks, skills, training materials, and traceability records.

4. **Graph Module**  
   - Backend generates the graph data based on stored relationships.  
   - Frontend visualizes the graph and updates connections in real time.

### Architecture Diagram (Simplified as teacher requested)

```mermaid
flowchart LR
    FE[Frontend UI<br/>(Dashboard, Editor, Graph Page)]
        --> BE[Backend Java Server<br/>(Logic + API)]

    BE --> DB[(Database<br/>Users / Risks / Skills / Links)]
    BE --> GM[Graph Module<br/>Generate Risk–Skill Links]

    GM --> FE
## 6.3 Backend Logic Flow

When the user interacts with the system (e.g., adds a risk or connects a skill),  
the backend follows this process:

1. Receive HTTP request from frontend  
2. Validate input  
3. Query or update the database  
4. Recalculate the risk–skill relationships  
5. Generate graph data structure (nodes + links)  
6. Return JSON response to the frontend  

This logic ensures that every training update is reflected immediately in the graph.
## 6.4 Data Model Overview

The system uses a simple relational structure:

- **Users**
  - id, name, role, password_hash
- **Risks**
  - risk_id, description
- **Skills**
  - skill_id, description
- **RiskSkillLinks**
  - link_id, risk_id, skill_id (many-to-many relationship)
- **TrainingMaterials**
  - material_id, skill_id, file_path

This structure supports risk–skill traceability and future extension.
## 6.5 API Endpoints

| Endpoint | Method | Description |
|----------|---------|-------------|
| /login | POST | User login |
| /risk/list | GET | Get all risks |
| /skill/list | GET | Get all skills |
| /link/create | POST | Create a risk–skill link |
| /graph/data | GET | Get graph JSON data |

These endpoints support all essential operations of the system.
