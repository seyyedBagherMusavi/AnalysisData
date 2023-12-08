CREATE EXTENSION if not exists tablefunc;
-- show summary statistics
SELECT 'age'  as category,
       PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY age) AS percentile_25,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY age) AS median,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY age) AS percentile_75,
    AVG(age) AS mean,Stddev(age)
FROM
    jupyter.insurance
union all
SELECT 'bmi'  as category,
       PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY bmi) AS percentile_25,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY bmi) AS median,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY bmi) AS percentile_75,
    AVG(bmi) AS mean,Stddev(bmi)
FROM
    jupyter.insurance
union all
SELECT 'charges'  as category,
       PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY charges) AS percentile_25,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY charges) AS median,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY charges) AS percentile_75,
    AVG(charges) AS mean,Stddev(charges)
FROM
    jupyter.insurance
union all
SELECT 'children'  as category,
       PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY children) AS percentile_25,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY children) AS median,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY children) AS percentile_75,
    AVG(children) AS mean,Stddev(children)
FROM
    jupyter.insurance;

-- show correlation between columns
select corr(age, age), corr(age, charges), corr(age, bmi), corr(age, children) from
    jupyter.insurance union all

select corr(bmi, age), corr(bmi, bmi), corr(bmi, children), corr(bmi, charges) from
    jupyter.insurance union all
select corr(children, age), corr(children, bmi), corr(children, children), corr(children, charges) from
    jupyter.insurance union all
select corr(charges, age), corr(charges, bmi), corr(charges, children), corr(charges, charges) from
    jupyter.insurance ;


