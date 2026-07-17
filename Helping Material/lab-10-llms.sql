DROP DATABASE IF EXISTS lab_10_task;
CREATE DATABASE lab_10_task;
USE lab_10_task;

CREATE TABLE providers (
    provider_id INT PRIMARY KEY,
    provider_name VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE models (
    model_id INT PRIMARY KEY,
    model_name VARCHAR(100),
    provider_id INT,
    release_date DATE,
    base_price DECIMAL(10,4),
    is_active BOOLEAN,
    FOREIGN KEY (provider_id) REFERENCES providers(provider_id)
);

CREATE TABLE usage_logs (
    log_id INT PRIMARY KEY,
    model_id INT,
    user_name VARCHAR(100),
    prompt_tokens INT,
    completion_tokens INT,
    request_time DATETIME,
    response_time DATETIME,
    cost DECIMAL(10,4),
    FOREIGN KEY (model_id) REFERENCES models(model_id)
);

INSERT INTO providers VALUES
(1, 'OpenAI', 'USA'),
(2, 'Anthropic', 'USA'),
(3, 'Google', 'USA'),
(4, 'Meta', 'USA');

INSERT INTO models VALUES
(1, 'ChatGPT-4', 1, '2023-03-14', 0.0300, TRUE),
(2, 'ChatGPT-3.5', 1, '2022-11-30', 0.0020, TRUE),
(3, 'Claude 3 Opus', 2, '2024-03-01', 0.0250, TRUE),
(4, 'Claude 2', 2, '2023-07-01', 0.0080, FALSE),
(5, 'Gemini Pro', 3, '2024-02-01', 0.0200, TRUE),
(6, 'LLaMA 2', 4, '2023-07-18', 0.0000, TRUE);

INSERT INTO usage_logs VALUES
(1, 1, 'Ali', 500, 300, '2024-01-10 10:00:00', '2024-01-10 10:00:05', 0.020),
(2, 2, 'Sara', 200, 150, '2024-01-11 12:00:00', '2024-01-11 12:00:02', 0.005),
(3, 3, 'John', 800, 500, '2024-01-12 15:30:00', '2024-01-12 15:30:07', 0.030),
(4, 1, 'Ali', 300, 200, '2024-01-15 09:00:00', '2024-01-15 09:00:04', 0.015),
(5, 5, 'Maria', 600, 400, '2024-01-20 18:00:00', '2024-01-20 18:00:06', 0.025),
(6, 6, 'Chen', 100, 80, '2024-01-22 20:00:00', '2024-01-22 20:00:01', 0.000);