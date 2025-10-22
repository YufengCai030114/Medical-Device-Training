
-- Roles for PostgREST anon access
CREATE ROLE web_anon NOLOGIN;
GRANT USAGE ON SCHEMA public TO web_anon;

-- Core tables
CREATE TABLE IF NOT EXISTS risk (
  id SERIAL PRIMARY KEY,
  code TEXT UNIQUE NOT NULL,
  title TEXT NOT NULL,
  severity INT NOT NULL CHECK (severity BETWEEN 1 AND 5),
  description TEXT
);

CREATE TABLE IF NOT EXISTS skill (
  id SERIAL PRIMARY KEY,
  code TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  level INT CHECK (level BETWEEN 1 AND 5),
  description TEXT
);

CREATE TABLE IF NOT EXISTS training_material (
  id SERIAL PRIMARY KEY,
  code TEXT UNIQUE NOT NULL,
  title TEXT NOT NULL,
  type TEXT NOT NULL,
  url TEXT,
  description TEXT
);

CREATE TABLE IF NOT EXISTS risk_skill (
  risk_id INT NOT NULL REFERENCES risk(id) ON DELETE CASCADE,
  skill_id INT NOT NULL REFERENCES skill(id) ON DELETE CASCADE,
  PRIMARY KEY (risk_id, skill_id)
);

CREATE TABLE IF NOT EXISTS skill_training (
  skill_id INT NOT NULL REFERENCES skill(id) ON DELETE CASCADE,
  training_material_id INT NOT NULL REFERENCES training_material(id) ON DELETE CASCADE,
  PRIMARY KEY (skill_id, training_material_id)
);

-- Default privileges for future tables
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO web_anon;

-- Grants
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO web_anon;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO web_anon;

-- Seeds
INSERT INTO risk (code, title, severity, description) VALUES
('R-001','Incorrect device calibration',5,'High severity: may cause patient harm'),
('R-002','Missing cleaning protocol',4,'Potential contamination risk'),
('R-003','Outdated training material',3,'Needs review and update')
ON CONFLICT (code) DO NOTHING;

INSERT INTO skill (code, name, level, description) VALUES
('S-001','Operate calibration tool',3,'Intermediate'),
('S-003','Apply cleaning standards',2,'Basic'),
('S-004','Revise training content',2,'Editorial')
ON CONFLICT (code) DO NOTHING;

INSERT INTO training_material (code, title, type, url, description) VALUES
('TM-002','Calibration Video','video','https://example.com/tm002','Walkthrough'),
('TM-005','Cleaning SOP v2','pdf','https://example.com/tm005','PDF document')
ON CONFLICT (code) DO NOTHING;

-- Demo links
INSERT INTO risk_skill (risk_id, skill_id)
SELECT r.id, s.id FROM risk r, skill s WHERE r.code='R-001' AND s.code='S-003'
ON CONFLICT DO NOTHING;

INSERT INTO skill_training (skill_id, training_material_id)
SELECT s.id, t.id FROM skill s, training_material t WHERE s.code='S-003' AND t.code='TM-002'
ON CONFLICT DO NOTHING;

-- Traceability view
CREATE OR REPLACE VIEW risk_traceability AS
SELECT r.id, r.code AS risk, r.title, r.severity,
       array_remove(array_agg(DISTINCT s.code), NULL) AS skills,
       array_remove(array_agg(DISTINCT t.code), NULL) AS materials
FROM risk r
LEFT JOIN risk_skill rs ON rs.risk_id = r.id
LEFT JOIN skill s ON s.id = rs.skill_id
LEFT JOIN skill_training st ON st.skill_id = s.id
LEFT JOIN training_material t ON t.id = st.training_material_id
GROUP BY r.id, r.code, r.title, r.severity
ORDER BY r.severity DESC, r.code;
