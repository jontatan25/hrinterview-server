class RemoveUsersIdFromExperiences < ActiveRecord::Migration[7.1]
  def change
    remove_column :experiences, :users_id
  end
end
