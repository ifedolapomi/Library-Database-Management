select * from student;
ALTER TABLE student
ADD CONSTRAINT approved_by
FOREIGN KEY (approved_by)
REFERENCES librarians(librarian_id);

SELECT* FROM book_searchbook_search;

-- insert values into the tables
select * from librarians;
INSERT INTO librarians (librarian_id, username, password, name, access_level)
VALUES 
(1, 'lib_admin', 'password123', 'Alice Johnson', 'admin'),
(2, 'lib_staff', 'pass456', 'Bob Smith', 'staff');

SELECT * FROM book;
INSERT INTO book (book_id, title, author, genre, year_published, avaliability, total_issues)
VALUES 
(1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 5, 20),
(2, '1984', 'George Orwell', 'Dystopian', 1949, 3, 15),
(3, 'Pride and Prejudice', 'Jane Austen', 'Romance', 1813, 2, 10);

SELECT * from student;

INSERT INTO student (student_id, name, matric_no, level, approved_by, status) 
VALUES 
(1, 'John Doe', 'MAT12345', '100', 1, 'approved'),
(2, 'Jane Smith', 'MAT67890', '200', 2, 'pending'),
(3, 'Sam Wilson', 'MAT54321', '300', 2, 'approved'),
(4, 'Lisa Brown', 'MAT98765', '400', 1, 'rejected');

SELECT * from book_search;
INSERT INTO book_search (student_id, search_query, search_date)
VALUES 
(1, 'Mockingbird', '2024-10-01'),
(2, '1984', '2024-10-05'),
(3, 'Pride', '2024-10-07');

SELECT * FROM book_issues;
INSERT INTO book_issues (book_id, student_id, librarian_id, borrow_date, return_date)
VALUES 
(1, 1, 1, '2024-10-01', '2024-10-10'),
(2, 2, 2, '2024-10-05', NULL),
(3, 1, 1, '2024-10-08', NULL);

SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Book_search' AND TABLE_SCHEMA = 'library';

ALTER TABLE `library`.`Book_search` 
ADD CONSTRAINT `fk_Student_id`
FOREIGN KEY (`student_id`)
REFERENCES `library`.`Student` (`Student_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

SELECT * FROM student;

-- Test Foreign Key Constraints
INSERT INTO book_issues (book_id, student_id, librarian_id, borrow_date, return_date)
VALUES (1, 1, 99, '2024-11-01', NULL);  -- This should fail due to non-existent librarian_id

-- query to check if the relationship between the table works correctly
--  Books Issued by Each Student
SELECT s.name AS student_name, b.title AS book_title, bi.borrow_date, bi.return_date
FROM book_issues bi
JOIN student s ON bi.student_id = s.student_id
JOIN book b ON bi.book_id = b.book_id;

-- Number of Times Each Book Was Issued
SELECT b.title, COUNT(bi.issue_id) AS times_issued
FROM book_issues bi
JOIN book b ON bi.book_id = b.book_id
GROUP BY b.title
ORDER BY times_issued DESC;

SELECT * from book_issues;

SET SQL_SAFE_UPDATES = 0;

UPDATE book_issues
SET book_total_issues = 0
WHERE book_total_issues IS NULL;

ALTER TABLE book_issues
MODIFY book_total_issues INT NOT NULL;

UPDATE book_issues
SET book_total_issues = 1
WHERE issue_id=1;






















