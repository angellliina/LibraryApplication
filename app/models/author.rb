class Author < ApplicationRecord
  has_and_belongs_to_many :books

  def get_sorted_authors_list
    authors = Author.find_by_sql("SELECT * FROM authors ORDER BY name ASC")
  end

  def update_author_name(author_id, new_name)
    ActiveRecord::Base.connection.execute("UPDATE authors SET name = '#{new_name}' WHERE id = #{author_id}")
  end

  def update_author_info
    author = Author.find(1)
    author.update(name: "New Name", age: 40, country: "New Country")
  end

  def update_author_books_count
    ActiveRecord::Base.connection.execute("UPDATE authors SET books_count = 10 WHERE id = 1")
  end
end
