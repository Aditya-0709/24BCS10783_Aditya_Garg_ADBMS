CREATE OR REPLACE FUNCTION calculate_payable()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
NEW. payable_amount := NEW. per_hour_salary * NEW.working_hours;
IF NEW.payable_amount>25000 THEN
RAISE EXCEPTION 'Amount greater then 25000 Not Allowed';
END IF;

RETURN NEW;
END;
$$;

CREATE TRIGGER trg_calculate_payable
BEFORE INSERT OR UPDATE ON employee
FOR EACH ROW
EXECUTE FUNCTION calculate_payable();

CREATE OR REPLACE FUNCTION employee_statement_log()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
RAISE NOTICE 'Rows Updated Sucessfully';
RETURN NULL;
END;
$$;

CREATE TRIGGER trg_employee_msg
AFTER INSERT OR UPDATE ON employee
FOR EACH STATEMENT
EXECUTE FUNCTION employee_statement_log();

-CREATE OR REPLACE FUNCTION employee_statement_log()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
RAISE NOTICE 'Rows Updated Sucessfully';
RETURN NULL;
END;
$$;

CREATE TRIGGER trg_employee_msg
AFTER INSERT OR UPDATE ON employee
FOR EACH STATEMENT
EXECUTE FUNCTION employee_statement_log();

-