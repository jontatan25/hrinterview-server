class RemoveUserIdFromExperiencesv2 < ActiveRecord::Migration[7.1]
  def change
    # Remove the foreign key constraint
    remove_foreign_key :experiences, :users
  end
end
