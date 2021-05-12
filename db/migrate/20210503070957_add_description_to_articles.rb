class AddDescriptionToArticles < ActiveRecord::Migration[6.1]
  def change
    # add_column :table_name, :attribute_name, :type
    add_column :articles, :description, :text
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime

  end
end
