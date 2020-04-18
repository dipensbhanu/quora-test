class RemoveSlugFromQuestions < ActiveRecord::Migration[6.0]
  def change
  	remove_column :questions, :slug
  end
end
