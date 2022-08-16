class AddTimestampsToArticles < ActiveRecord::Migration[7.0]
  def changes
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
