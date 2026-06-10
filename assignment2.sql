USE InsuranceDB;
-- Create Users

CREATE USER 'branch_manager'@'localhost' IDENTIFIED BY 'bm123';
CREATE USER 'policy_auditor'@'localhost' IDENTIFIED BY 'pa123';
CREATE USER 'policy_admin'@'localhost' IDENTIFIED BY 'admin123';
-- Grant Privileges
-- branch_manager can INSERT and UPDATE
GRANT INSERT, UPDATE ON Policy TO 'branch_manager'@'localhost';

-- policy_auditor can only SELECT
GRANT SELECT ON Policy TO 'policy_auditor'@'localhost';

-- policy_admin gets all privileges
GRANT ALL PRIVILEGES ON InsuranceDB.* TO 'policy_admin'@'localhost'
WITH GRANT OPTION;

FLUSH PRIVILEGES;