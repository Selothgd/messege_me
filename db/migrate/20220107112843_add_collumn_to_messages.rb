class AddCollumnToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :body, :text
    add_column :messages, :user_id, :int
  end
end

