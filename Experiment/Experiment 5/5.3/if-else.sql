-- If-else block in pl/pgsql

DO $$
DECLARE
    age INT := 18;
BEGIN
    IF age >= 18 THEN
        RAISE NOTICE 'YOUR AGE IS % AND YOU ARE ELIGIBLE TO VOTE', age;
        RAISE NOTICE 'YOU ARE INSIDE BEGIN END BLOCK';
    END IF;
END;
$$ LANGUAGE plpgsql;


-- If-elseif-else block in pl/pgsql

DO $$ 
DECLARE
    age INT := 17;
BEGIN
    IF age >= 18 THEN
        RAISE NOTICE 'YOUR AGE IS % AND YOU ARE ELIGIBLE TO VOTE', age;
    ELSE
        RAISE NOTICE 'YOUR AGE IS % AND YOU ARE NOT ELIGIBLE TO VOTE', age;
    END IF;
    
    RAISE NOTICE 'YOU ARE INSIDE BEGIN END BLOCK';
END;
$$ LANGUAGE plpgsql;


-- Nested if-else block in pl/pgsql

DO $$ 
DECLARE
    val INT := 17;
BEGIN
    IF val >= 0 AND val <= 10 THEN
        RAISE NOTICE 'VALUE IS % AND RANGE BETWEEN 1 TO 10', val;
    ELSIF val > 10 AND val <= 20 THEN
        RAISE NOTICE 'VALUE IS % AND RANGE BETWEEN 11 TO 20', val;
    ELSE
        RAISE NOTICE 'VALUE IS % AND VALUE IS GREATER THAN 20', val;
    END IF;

    RAISE NOTICE 'YOU ARE INSIDE BEGIN END BLOCK';
END;
$$ LANGUAGE plpgsql;