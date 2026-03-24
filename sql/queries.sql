-- Query 1: Job count by country
SELECT 
    country,
    COUNT(*) as total_jobs,
    ROUND(AVG(salary_avg), 0) as avg_salary,
    SUM(is_remote) as remote_jobs,
    ROUND(SUM(is_remote)*100.0/COUNT(*), 1) as remote_pct
FROM jobs
WHERE salary_avg IS NOT NULL
GROUP BY country
ORDER BY total_jobs DESC;

-- Query 2: Most in-demand skills
SELECT 'SQL' as skill, COUNT(*) as job_count
FROM jobs WHERE skills_mentioned LIKE '%sql%'
UNION ALL
SELECT 'Python', COUNT(*) FROM jobs 
    WHERE skills_mentioned LIKE '%python%'
UNION ALL
SELECT 'Power BI', COUNT(*) FROM jobs 
    WHERE skills_mentioned LIKE '%power bi%'
UNION ALL
SELECT 'Tableau', COUNT(*) FROM jobs 
    WHERE skills_mentioned LIKE '%tableau%'
UNION ALL
SELECT 'Excel', COUNT(*) FROM jobs 
    WHERE skills_mentioned LIKE '%excel%'
UNION ALL
SELECT 'Azure', COUNT(*) FROM jobs 
    WHERE skills_mentioned LIKE '%azure%'
UNION ALL
SELECT 'AWS', COUNT(*) FROM jobs 
    WHERE skills_mentioned LIKE '%aws%'
UNION ALL
SELECT 'Snowflake', COUNT(*) FROM jobs 
    WHERE skills_mentioned LIKE '%snowflake%'
ORDER BY job_count DESC;

-- Query 3: Salary by country
SELECT 
    country,
    COUNT(*) as jobs_with_salary,
    ROUND(MIN(salary_avg), 0) as min_salary,
    ROUND(AVG(salary_avg), 0) as avg_salary,
    ROUND(MAX(salary_avg), 0) as max_salary
FROM jobs
WHERE salary_avg IS NOT NULL 
  AND salary_avg > 10000
GROUP BY country
ORDER BY avg_salary DESC;

-- Query 4: Remote vs onsite
SELECT
    country,
    SUM(CASE WHEN is_remote = 1 THEN 1 ELSE 0 END) as remote,
    SUM(CASE WHEN is_remote = 0 THEN 1 ELSE 0 END) as onsite,
    ROUND(SUM(is_remote)*100.0/COUNT(*), 1) as remote_pct
FROM jobs
GROUP BY country
ORDER BY remote_pct DESC;

-- Query 5: Top hiring companies
SELECT 
    company,
    country,
    COUNT(*) as open_roles,
    ROUND(AVG(salary_avg), 0) as avg_salary
FROM jobs
WHERE company != '' 
  AND company IS NOT NULL
GROUP BY company, country
ORDER BY open_roles DESC
LIMIT 15;

-- Query 6: Visa sponsorship companies
SELECT 
    company,
    country,
    title,
    COUNT(*) as open_roles
FROM jobs
WHERE 
    description LIKE '%visa sponsorship%'
    OR description LIKE '%sponsor visa%'
    OR description LIKE '%skilled worker visa%'
    OR description LIKE '%tier 2%'
    OR description LIKE '%relocation%'
    OR description LIKE '%sponsorship provided%'
GROUP BY company, country
ORDER BY open_roles DESC
LIMIT 20;

-- View: Market insights
CREATE VIEW IF NOT EXISTS market_insights AS
SELECT
    country,
    COUNT(*) as total_postings,
    ROUND(AVG(salary_avg), 0) as avg_salary,
    ROUND(SUM(is_remote)*100.0/COUNT(*), 1) as remote_pct,
    SUM(CASE WHEN skills_mentioned LIKE '%sql%' 
        THEN 1 ELSE 0 END) as sql_demand,
    SUM(CASE WHEN skills_mentioned LIKE '%python%' 
        THEN 1 ELSE 0 END) as python_demand,
    SUM(CASE WHEN skills_mentioned LIKE '%power bi%' 
        THEN 1 ELSE 0 END) as powerbi_demand,
    SUM(CASE WHEN description LIKE '%visa sponsorship%'
        OR description LIKE '%skilled worker visa%'
        OR description LIKE '%relocation%'
        THEN 1 ELSE 0 END) as visa_friendly_jobs,
    CASE
        WHEN AVG(salary_avg) > 60000 
            THEN 'HIGH VALUE MARKET'
        WHEN AVG(salary_avg) > 40000 
            THEN 'MID VALUE MARKET'
        ELSE 
            'DEVELOPING MARKET'
    END as market_signal
FROM jobs
WHERE salary_avg > 10000
GROUP BY country;