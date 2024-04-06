USE MYSQL;

CREATE USER 'nicolas.kossacoff'@'localhost' IDENTIFIED BY '14MC02NK08MM'; -- This creates an user
GRANT SELECT ON *.* TO 'nicolas.kossacoff'@'localhost'; -- We grant this user read-only access

CREATE USER 'nicolas.t.kossacoff'@'localhost' IDENTIFIED BY '14MC02NK08MM'; -- This creates a second user
GRANT SELECT, INSERT, UPDATE ON *.* TO 'nicolas.t.kossacoff'@'localhost'; -- We grant this user read and writing access.
