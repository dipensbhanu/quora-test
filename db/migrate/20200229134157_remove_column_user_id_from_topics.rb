class RemoveColumnUserIdFromTopics < ActiveRecord::Migration[6.0]
  def change
    remove_column :topics, :user_id
  end
end
