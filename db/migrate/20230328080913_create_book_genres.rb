class CreateBookGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :book_genres do |t|
      t.integer :book_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
