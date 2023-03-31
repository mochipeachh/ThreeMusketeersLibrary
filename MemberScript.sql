use Library;

# (1) : As a library member, I want to be able to browse the entire collection.

select title, author_name, publication_date, publisher, description, available from books;

# (2): As a library member, I want to be able to search books by title.

select title, author_name, publication_date, publisher, description, available from books where title like "%and%";

# (3): As a library member, I want to be able to search books by author.

select title, author_name, publication_date, publisher, description, available from books where author_name like "%austen%";

# (4): As a library member, I want to be able to search books by genre.

CALL get_books_by_genre('mystery');

# (5): As a library member, I want to be able to see all books that are available.

select * from books where available = 1;



########## Showing librarian operations do not work ##########

CALL get_member_loans('Smith');