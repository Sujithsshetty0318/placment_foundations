USE InsuranceDB;
REVOKE UPDATE ON Policy FROM 'branch_manager'@'localhost';
FLUSH PRIVILEGES;