class ReaderCard < ApplicationRecord
  belongs_to :user
  belongs_to :library

  def update_reader_card
    reader_card = ReaderCard.find_by(card_number: '12345678')
    reader_card.update(library_id: 2)
  end

  def update_reader_card_sql
    ReaderCard.connection.execute("UPDATE reader_cards SET library_id = 3 WHERE id = 1")
  end

  def reader_cards_for_library(library_id)
    ReaderCard.where(library_id: library_id)
  end

  def get_reader_card_user_list
    ActiveRecord::Base.connection.execute("CREATE VIEW reader_cards_users AS SELECT reader_cards.id, users.name FROM reader_cards JOIN users ON reader_cards.user_id = users.id")
  end

  def update_reader_card_info
    ActiveRecord::Base.connection.execute("UPDATE reader_cards SET reader_name = 'New Reader Name' WHERE id = 1")
  end
end
