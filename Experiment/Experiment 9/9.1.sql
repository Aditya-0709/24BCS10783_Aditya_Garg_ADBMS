CREATE OR REPLACE TRIGGER trg_salary_hike
BEFORE UPDATE OF salary ON Salary_Hike
FOR EACH ROW
DECLARE
    salary_limit_exceeded EXCEPTION;
BEGIN
    IF :NEW.salary > :OLD.salary * 1.15 THEN
        RAISE salary_limit_exceeded;
    END IF;

EXCEPTION
    WHEN salary_limit_exceeded THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Salary increase cannot exceed 15% of the old salary.'
        );
END;
/