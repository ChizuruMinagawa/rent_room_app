class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_image, :string
    add_column :users, :user_name, :string, null: false
    add_column :users, :introduction, :text
  end
end
