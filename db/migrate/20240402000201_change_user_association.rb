class ChangeUserAssociation < ActiveRecord::Migration[7.1]
  def change
    remove_reference :experiences, :user, index: true
    add_reference :candidates, :user, null: false, foreign_key: true
  end
end
