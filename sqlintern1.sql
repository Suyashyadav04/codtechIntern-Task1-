-- Library Management System-- 
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    published_year INT,
    copies_available INT NOT NULL
);

CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(15),
    membership_date DATE NOT NULL
);

CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

INSERT INTO Books (title, author, genre, published_year, copies_available)
VALUES
('1984', 'George Orwell', 'Dystopian', 1949, 5),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 3),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Classics', 1925, 2);

INSERT INTO Members (name, email, phone, membership_date)
VALUES
('John Doe', 'john.doe@example.com', '1234567890', '2023-01-15'),
('Jane Smith', 'jane.smith@example.com', '0987654321', '2023-02-20');

UPDATE Books
SET copies_available = copies_available - 1
WHERE book_id = 1;

UPDATE Members
SET phone = '1112223333'
WHERE member_id = 2;

DELETE FROM Books
WHERE book_id = 3;

DELETE FROM Members
WHERE member_id = 1;

SELECT * FROM Books;
SELECT * FROM Members;
SELECT 
    T.transaction_id,
    B.title AS book_title,
    M.name AS member_name,
    T.borrow_date,
    T.return_date
FROM 
    Transactions T
JOIN 
    Books B ON T.book_id = B.book_id
JOIN 
    Members M ON T.member_id = M.member_id;

SELECT title, copies_available
FROM Books
WHERE book_id = 1;


