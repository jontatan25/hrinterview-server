class RemoveUserIdFromExperiences < ActiveRecord::Migration[7.1]
  def change
    remove_column :experiences, :user_id
  end
end
