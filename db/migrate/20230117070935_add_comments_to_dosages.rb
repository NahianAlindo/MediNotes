class AddCommentsToDosages < ActiveRecord::Migration[6.0]
  def change
    add_column :dosages, :comments, :text
  end
end
