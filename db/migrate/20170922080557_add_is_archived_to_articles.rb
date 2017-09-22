class AddIsArchivedToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :is_archived, :boolean, default: false
  end
end
