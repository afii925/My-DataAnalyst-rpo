
DROP TABLE IF EXISTS Book_Categories_BCNF, Book_Authors_BCNF, Categories, Authors, Books_2NF, Publishers;

--- Create Publishers Table
CREATE TABLE Publishers (
    Publisher_ID INT PRIMARY KEY AUTO_INCREMENT,
    Publisher_Name VARCHAR(50) UNIQUE
);

--- Create Books Table (2NF)
CREATE TABLE Books_2NF (
    Book_ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Publisher_ID INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (Publisher_ID) REFERENCES Publishers(Publisher_ID) ON DELETE CASCADE
);

-- Create Authors Table (BCNF)
CREATE TABLE Authors (
    Author_ID INT PRIMARY KEY AUTO_INCREMENT,
    Author_Name VARCHAR(100) UNIQUE
);

-- Create Book_Authors Table (BCNF - Many-to-Many Relationship)
CREATE TABLE Book_Authors_BCNF (
    Book_ID INT,
    Author_ID INT,
    PRIMARY KEY (Book_ID, Author_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books_2NF(Book_ID) ON DELETE CASCADE,
    FOREIGN KEY (Author_ID) REFERENCES Authors(Author_ID) ON DELETE CASCADE
);

-- Create Categories Table (BCNF)
CREATE TABLE Categories (
    Category_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_Name VARCHAR(100) UNIQUE
);

-- Create Book_Categories Table (BCNF - Many-to-Many Relationship)
CREATE TABLE Book_Categories_BCNF (
    Book_ID INT,
    Category_ID INT,
    PRIMARY KEY (Book_ID, Category_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books_2NF(Book_ID) ON DELETE CASCADE,
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID) ON DELETE CASCADE
);

-- Insert Sample Data into Publishers
INSERT INTO Publishers (Publisher_Name) VALUES ('Penguin Books'), ('HarperCollins'), ('Oxford Press');

-- Insert Sample Data into Books
INSERT INTO Books_2NF (Title, Publisher_ID, Price) VALUES 
('Database Systems', 1, 45.99),
('SQL for Beginners', 2, 29.99),
('Advanced Normalization', 3, 39.99);

-- Insert Sample Data into Authors
INSERT INTO Authors (Author_Name) VALUES ('C.J. Date'), ('Elmasri & Navathe'), ('Ramez Elmasri');

-- Insert Sample Data into Book_Authors
INSERT INTO Book_Authors_BCNF (Book_ID, Author_ID) VALUES 
(1, 1),
(2, 2),
(3, 3);

-- Insert Sample Data into Categories
INSERT INTO Categories (Category_Name) VALUES ('Database'), ('SQL'), ('Programming');

-- Insert Sample Data into Book_Categories
INSERT INTO Book_Categories_BCNF (Book_ID, Category_ID) VALUES 
(1, 1),
(2, 2),
(3, 3);

-- Verify Data with SELECT Queries
SELECT * FROM Books_2NF;
SELECT * FROM Publishers;
SELECT * FROM Authors;
SELECT * FROM Categories;
SELECT * FROM Book_Authors_BCNF;
SELECT * FROM Book_Categories_BCNF;
