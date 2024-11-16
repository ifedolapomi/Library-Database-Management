# Library-Database-Management

## process
### Set Up the SQL Database
1. Data modeling and table creation
2. Data Population and Initial Testing
3. Run simple Query
4. Test the query
5. Perform Update and Delete Tests
### Write SQL Queries for Operations
### Set Up the MySQL Database Connection
using !pip install mysql-connector-python
and connecting it to the local machine sql



### Set Up the MySQL Database Connection
    install mysql-connector-python

## Features
- Librarians can be given their authorized login ID and password without which the system can not be accessed.
- Students can only access limited features, i.e., public access level features which include searching a book and student registration form.
- After logging in librarians can search for a specific book, book issue or student from the home panel.
- Librarians need to make an entry for new books. To automate the process they simply need to enter the number of issues, then the Issue ID for each book issue is generated automatically.
- Another responsibility of a librarian is to approve students in situations where approval is needed, i.e. where documents are to be verified or some manual work. Librarians have a panel 
  to simply approve / reject students and to view all approved students. The librarian ID is stored alongside each approved/rejected student to keep track.
- The most important function of any library is to issue and return books. This system includes a panel to view all outstanding logs and a super simple panel to issue and return books for 
  all librarians.
