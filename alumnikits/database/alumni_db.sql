CREATE DATABASE IF NOT EXISTS alumni_db;
USE alumni_db;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    reg_number VARCHAR(50) UNIQUE NOT NULL,
    batch_year INT NOT NULL,
    branch VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    linkedin_url VARCHAR(255),
    profile_image LONGBLOB,
    user_type ENUM('student', 'admin') DEFAULT 'student',
    status ENUM('pending', 'approved', 'rejected', 'blocked') DEFAULT 'pending',
    approval_date TIMESTAMP NULL,
    approved_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (approved_by) REFERENCES users(id)
);

-- Insert initial admin user with correct password hash for 'kits@123'
INSERT INTO users (firstname, lastname, email, password, user_type, status, reg_number, batch_year, branch) 
VALUES ('HOD', 'Admin', 'hod@kits.com', '$2y$10$YHUUYONl2GVRmNtFJF0WZe.rlvHa.yoVOCDC5N3xBZCb.JqX0MAui', 'admin', 'approved', 'ADMIN001', 2023, 'ADMIN');
