class Library < ApplicationRecord
  has_many :books
  has_many :reader_cards

  def update_library_info
    library = Library.find_by(name: 'Library 1')
    library.update(location: 'New Library Location')
  end

  def update_library_sql
    Library.connection.execute("UPDATE libraries SET phone_number = '123-456-7890' WHERE id = 1")
  end

  def get_sorted_libraries_list
    libraries = Library.order(name: :asc)
  end

  def update_library_name(library_id, new_name)
    library = Library.find(library_id)
    library.update(name: new_name)
  end

  def library_books
    library_books = Book.find_by_sql("SELECT b.* FROM books b INNER JOIN libraries_books lb ON b.id = lb.book_id WHERE lb.library_id = 1 ORDER BY b.title ASC")
  end

  def update_library_info_id
    library = Library.find(1)
    library.update(name: "New Library Name", address: "New Address", phone: "New Phone")
  end
end
