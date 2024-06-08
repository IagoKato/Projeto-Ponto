USE alper_ponto;

DROP TABLE IF EXISTS working_hours, users;
CREATE TABLE users (
    id INT(6) AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    is_admin BOOLEAN NOT NULL DEFAULT false
);
CREATE TABLE working_hours (
    id INT(6) AUTO_INCREMENT PRIMARY KEY, 
    user_id INT(6),
    work_date DATE NOT NULL,
    time1 TIME,
    time2 TIME,
    time3 TIME,
    time4 TIME,
    worked_time INT,

    FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT cons_user_day UNIQUE (user_id, work_date)
);

-- Senha criptografada
INSERT INTO users (id, name, password, email, start_date, end_date, is_admin)
VALUES (1, 'Iago', '$2y$10$/vC1UKrEJQUZLN2iM3U9re/4DQP74sXCOVXlYXe/j9zuv1/MHD4o.', 'iago@agenciaalper.com.br', '2022-02-14', null, 1);

INSERT INTO users (id, name, password, email, start_date, end_date, is_admin)
VALUES (2, 'Gabriel', '$2y$10$/vC1UKrEJQUZLN2iM3U9re/4DQP74sXCOVXlYXe/j9zuv1/MHD4o.', 'gabriel@agenciaalper.com.br', '2000-1-1', null, 1);

INSERT INTO users (id, name, password, email, start_date, end_date, is_admin)
VALUES (3, 'Bruna', '$2y$10$/vC1UKrEJQUZLN2iM3U9re/4DQP74sXCOVXlYXe/j9zuv1/MHD4o.', 'bruna@agenciaalper.com.br', '2000-1-1', null, 0);

INSERT INTO users (id, name, password, email, start_date, end_date, is_admin)
VALUES (4, 'Tooru', '$2y$10$/vC1UKrEJQUZLN2iM3U9re/4DQP74sXCOVXlYXe/j9zuv1/MHD4o.', 'tooru@agenciaalper.com.br', '2000-1-1', null, 0);

INSERT INTO users (id, name, password, email, start_date, end_date, is_admin)
VALUES (5, 'Edson', '$2y$10$/vC1UKrEJQUZLN2iM3U9re/4DQP74sXCOVXlYXe/j9zuv1/MHD4o.', 'edson@agenciaalper.com.br', '2000-1-1', '2019-1-1', 0);

INSERT INTO users (id, name, password, email, start_date, end_date, is_admin)
VALUES (6, 'Allan', '$2y$10$C20BlxSSRNthShaojaf/JOPNmY80LeERK4SAN0hyZKzFWa4buu.IS', 'allan@agenciaalper.com.br', '2023-07-31', NULL, 0);

INSERT INTO users (id, name, password, email, start_date, end_date, is_admin)
VALUES (7, 'Eduardo', '$2y$10$w4ZcZ9tpdFBMW5YcnMUI8OyTvkKzngeMAewjHQo9MpoH009qBLdFe', 'eduardo@agenciaalper.com.br', '2023-08-01', NULL, 1);

INSERT INTO users (id, name, password, email, start_date, end_date, is_admin)
VALUES (8, 'Jeimes', '$2y$10$n51rh12/.Pmbewdy9Ex//ek9obEJSHXVvVGeFhymeaLK0xB2DiTpy', 'jeimes@agenciaalper.com.br', '2023-08-01', NULL, 0);

INSERT INTO users (id, name, password, email, start_date, end_date, is_admin)
VALUES (9, 'Milena', '$2y$10$KM7R4aUIMtS01jAR/TeitulTIB9fxU21eced2yI4ZV5hMKsdO1lq.', 'milena@agenciaalper.com.br', '2023-08-01', NULL, 0);

INSERT INTO users (id, name, password, email, start_date, end_date, is_admin)
VALUES (10, 'Joao', '$2y$10$U7QRq7RTkLJXyuNGhe2Y2u/qlR/DotpcxNJBayiyj0whMH3omMp/K', 'joao@agenciaalper.com.br', '2023-08-01', NULL, 0);

INSERT INTO users (id, name, password, email, start_date, end_date, is_admin)
VALUES (11, 'Gustavo', '$2y$10$Bt2t1lk4iH9VqhHqTXWY7O8BWn2k5Li9.Yo/qP0PCxIkZzWz/pZBm', 'gustavo@agenciaalper.com.br', '2023-08-01', NULL, 0);

INSERT INTO users (id, name, password, email, start_date, end_date, is_admin)
VALUES (12, 'Tetz', '$2y$10$xL9X9hl3FII2cuvMNYKmI.fJroV.Xq35ohnl8DWa1nYcg85XLVjky', 'design@agenciaalper.com.br', '2023-08-03', NULL, 0);

INSERT INTO users (id, name, password, email, start_date, end_date, is_admin)
VALUES (13, 'Amanda', '$2y$10$qxHIIE9h0b..al28eUOxGuXXYgN8R2LvPBT3ccA.73.3PT0.WP3Ca', 'amanda@agenciaalper.com.br', '2023-08-03', NULL, 0);

INSERT INTO users (id, name, password, email, start_date, end_date, is_admin)
VALUES (14, 'Matheus', '$2y$10$KCaiaETQRQZcWza8R2GHe.qIiBFOe3qK6IAc5x/3nbZpLKnGek4Ca', 'matheus@agenciaalper.com.br', '2023-08-03', NULL, 0);

INSERT INTO users (id, name, password, email, start_date, end_date, is_admin)
VALUES (15, 'Henrique', '$2y$10$mZI/L.qcjnySsOgvPDbCauKdi3dBSOl/qwer76HlTD7ZrBMKbUokK', 'henrique@agenciaalper.com.br', '2023-08-03', NULL, 0);

INSERT INTO users (id, name, password, email, start_date, end_date, is_admin)
VALUES (16, 'Rodrigo', '$2y$10$bPJqeT/6TjIf2Ts0NcGdFekza9Sivwez9LIdGiFWM/M2NAxE3zlke', 'rodrigo@agenciaalper.com.br', '2023-08-03', NULL, 0);

INSERT INTO users (id, name, password, email, start_date, end_date, is_admin)
VALUES (17, 'Andre', '$2y$10$Y2GxklQ3yQC3PiNzfPIkouRwoWi6KchHFLgwdUfeqpVL2.FiEcqIO', 'andre@agenciaalper.com.br', '2023-08-03', NULL, 0);
