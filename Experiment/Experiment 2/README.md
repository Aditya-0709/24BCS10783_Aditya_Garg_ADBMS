# Advanced SQL -- Set Operators

## 1. UNION

Combines the result of two or more `SELECT` statements and **removes
duplicate rows**.

### Syntax

``` sql
SELECT * FROM table1
UNION
SELECT * FROM table2;
```

### Rules

-   Both queries must return the **same number of columns**.
-   Corresponding columns must have **compatible data types**.
-   Duplicate rows are removed automatically.

### Example

``` sql
SELECT * FROM Arts
UNION
SELECT * FROM Science;
```

------------------------------------------------------------------------

## 2. UNION ALL

Combines the result of two or more `SELECT` statements and **keeps
duplicate rows**.

### Syntax

``` sql
SELECT column_name FROM table1
UNION ALL
SELECT column_name FROM table2;
```

### Example

``` sql
SELECT emp_name FROM employee
UNION ALL
SELECT emp_name FROM pt_employee;
```

------------------------------------------------------------------------

## 3. INTERSECT

Returns only the rows that are **common** in both queries.

### Syntax

``` sql
SELECT column_name FROM table1
INTERSECT
SELECT column_name FROM table2;
```

### Example

``` sql
SELECT f_name FROM fruit
INTERSECT
SELECT inv_name FROM inventory;
```

------------------------------------------------------------------------

## 4. EXCEPT

Returns rows from the **first query** that are **not present** in the
second query.

### Syntax

``` sql
SELECT column_name FROM table1
EXCEPT
SELECT column_name FROM table2;
```

### Example

``` sql
SELECT f_name FROM fruit
EXCEPT
SELECT inv_name FROM inventory;
```

