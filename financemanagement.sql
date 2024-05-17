CREATE DATABASE financemanagement;

CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    username VARCHAR(50),
    password VARCHAR(50),
    email VARCHAR(100),
	contactNumber Varchar(100) NOT NULL
);

CREATE TABLE Expenses (
    expense_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [user_id] INT  NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    category_id INT NOT NULL,
    date DATE NOT NULL,
    description VARCHAR(255),
    FOREIGN KEY ([user_id]) REFERENCES Users([user_id]),
    FOREIGN KEY (category_id) REFERENCES ExpenseCategories(category_id)
);


CREATE TABLE ExpenseCategories (
    category_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    category_name VARCHAR(50)
);


INSERT INTO Users (username, password, email,ContactNumber)
VALUES
( 'Ram', 'Password@123', 'Ram@example.com',123456789),
( 'Lakshman', 'Hello@456', 'Lakshman@example.com',1234570808)


INSERT INTO ExpenseCategories (category_name)
VALUES
('Gaming')
( 'Savings'),
( 'Transportation');


INSERT INTO Expenses ( [user_id],amount, category_id,date, description)
VALUES

( 2,20000.00,1,  '2024-04-28', 'Savings'),
( 3,3000.00, 1, '2024-04-29', 'Transportation');

select * from ExpenseCategories;
select * from Users;
select * from Expenses;

ALTER TABLE Expenses
DROP COLUMN user_id;
INSERT INTO Expenses ( [user_id],amount, category_id,date, description)
VALUES(4,200000,1,'2024-03-12','Gaming')
DECLARE @user_id INT
SET @user_id = 4
INSERT INTO Expenses ( [user_id],amount, category_id,date, description)
VALUES(6,200000,1,'2024-03-12 12:12:12','Gaming')

ALTER TABLE Expenses
DROP COLUMN Date;
ALTER TABLE Expenses
ADD StartDate DATE NULL,
    EndDate DATE NULL;
	CREATE TABLE Expenses (
    expense_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [user_id] INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    category_id INT NOT NULL,
    StartDate DATE NULL,
    EndDate DATE NULL,
    description VARCHAR(255),
    FOREIGN KEY ([user_id]) REFERENCES Users([user_id]),
    FOREIGN KEY (category_id) REFERENCES ExpenseCategories(category_id)
);

-- Insert sample data into Expenses table
INSERT INTO Expenses ([user_id], amount, category_id, StartDate, EndDate, description)
VALUES
(4, 10000.00, 1, '2024-01-01', '2024-01-05', 'Transportation'),
(2, 15000.00, 2, '2024-02-01', '2024-02-05', 'Education'),
(3, 20000.00, 3, '2024-03-01', '2024-03-05', 'Gaming')

select * from Expenses
select * from Users

select * from Expenses where StartDate >= '2024-02-01' and EndDate <= '2024-02-05'