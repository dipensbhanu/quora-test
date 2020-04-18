class AddTopicIdToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_reference :questions, :topic, foreign_key: true
  end
end
