CREATE DATABASE IF NOT EXISTS hr;

CREATE TABLE IF NOT EXISTS hr.vac
(
  Ids UInt32,
  Employer String,
  Name String,
  Salary Bool,
  From Nullable(Float32),
  To Nullable(Float32),
  Experience String,
  Schedule String,
  Keys String,
  Description String,
  Area String,
  Professional_roles String,
  Specializations String,
  Profarea_names String,
  Published_at DateTime
)
ENGINE = MergeTree()
ORDER BY (Area, Ids);
-- Импортируем данные из csv файла
INSERT INTO hr.vac
  FROM INFILE '/docker-entrypoint-initdb.d/IT_vacancies_full.csv'
  FORMAT CSVWithNames;
-- Удаляем лишние столбцы
ALTER TABLE hr.vac 
  DROP COLUMN Professional_roles, 
  DROP COLUMN Specializations, 
  DROP COLUMN Profarea_names; 