use Library;

# (6): As a librarian, I want to be able to see what books a member has on loan.

CALL get_member_loans('Smith');

# (7): As a librarian, I want to be able to see number of titles checked out by a given member; limit to 7.

SELECT COUNT(*)
FROM loans
WHERE member_id = 1
AND date_returned IS NOT NULL;

# (8): As a librarian, I want to be able to see if a loan is overdue to prevent member from checking out more books

select * from loans where days_overdue !=0;

# (9): As a librarian, I want to be able to see if a loan is overdue to take payment for penalties (Dev note - use the loans table)

select concat(members.first_name, " ", members.last_name, " has to pay a fee of £") as penalty_member, loans.days_overdue*0.05 as penalty
from members
left outer join loans on loans.member_id = members.member_id where days_overdue!=0;

# (10): As a librarian, I want to be able to add books.

insert into books(title, author_name, publication_date, publisher, description, available) VALUES
('War and Peace', 'Leo Tolstoy', '1867-01-28', 'Gottsberger', 'The novel chronicles the French invasion of Russia and the impact of the Napoleonic era on Tsarist society through the stories of five Russian aristocratic families.', 1);

# (11): As a librarian, I want to be able to remove books.

SELECT * FROM books;

DELETE
FROM books
WHERE book_id = 4;

SELECT * FROM books;

# (12): As a librarian, I want to be able to update book records.

UPDATE books
SET description = 'Love, family and social status in 19th century England.'
WHERE book_id = 1;

# (13a): As a librarian, I want to be able to check in books.

# check_out_book(book_id, member_id, return_date)
select * from loans;
CALL check_in_book(3, 6, '2023-03-19');

# (13b):As a librarian, I want to be able to check out books.

# check_out_book(book_id, member_id, @loan_id)
select * from books;
CALL check_out_book(1, 3, @loan_id);

# (14): As a librarian, I want to be able to add members.

insert into members(first_name, last_name, email, membership_status, address) VALUES
('Clara', 'Johnson', 'clarajohnson@example.com', 'Active', '2 London Avenue');
select * from members;

# (15):As a librarian, I want to be able to search members by last name.

CALL get_member_details('Smith');

# (16): As a librarian, I want to be able to remove members.

SELECT * FROM members;
DELETE
FROM members
WHERE member_id = 8;
SELECT * FROM members;

# (17): As a librarian, I want to be able to update member details.

select * from members;
update members set last_name = "Rochester" where member_id = 2;