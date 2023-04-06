class Book < ApplicationRecord
  belongs_to :library
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :genres

  def update_book_info
    book = Book.first
    book.update(title: 'New Book Title', description: 'New Book Description')
  end

  def update_all_books
    Book.all.each do |book|
      book.update(title: 'New Book Title', description: 'New Book Description')
      end
  end

  def update_books_sql
    Book.update_all("published_year = 2022", "published_year = 2021")
  end

  def get_books_count_2022
  count = ActiveRecord::Base.connection.execute("SELECT COUNT(*) FROM books WHERE published_year = 2022").first.first
  end

  def get_books_by_author(author_id)
    books = ActiveRecord::Base.connection.execute("SELECT * FROM books WHERE author_id = #{author_id}")
    Book.find(books.map { |book| book['id'] })
  end

  def update_book_title(book_id, new_title)
    book = Book.find(book_id)
    book.update(title: new_title)
  end

  def get_book_author_list
    ActiveRecord::Base.connection.execute("CREATE VIEW book_authors AS SELECT books.title, authors.name FROM books JOIN book_authors ON books.author_id = authors.id")
  end

  def update_book_title_id
    book = Book.find(1)
    book.title = "New Title"
    book.save
  end

  def genre_books
    genre_books = Book.find_by_sql("SELECT b.* FROM books b INNER JOIN books_genres bg ON b.id = bg.book_id INNER JOIN genres g ON bg.genre_id = g.id WHERE g.name = 'Mystery' ORDER BY b.title ASC")
  end

  def library_books_view
    ActiveRecord::Base.connection.execute("CREATE VIEW library_books_view AS SELECT b.* FROM books b INNER JOIN libraries_books lb ON b.id = lb.book_id ORDER BY b.title ASC")
  end

  def author_books_view
    ActiveRecord::Base.connection.execute("CREATE VIEW author_books_view AS SELECT b.* FROM books b INNER JOIN authors_books ab ON b.id = ab.book_id ORDER BY b.published_year ASC")
  end
end
