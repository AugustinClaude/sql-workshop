ALTER TABLE migration.companies
ADD growth numeric(6, 2) DEFAULT 0 NOT NULL CHECK (abs(growth) <= 1000 AND growth >= 0);
