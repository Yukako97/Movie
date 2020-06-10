class AddBodyToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :synopsis, :text
    add_column :movies, :year, :string
    add_column :movies, :cast, :text
    add_column :movies, :director, :text
  end
end
