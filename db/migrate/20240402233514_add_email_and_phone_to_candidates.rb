class AddEmailAndPhoneToCandidates < ActiveRecord::Migration[7.1]
  def change
    add_column :candidates, :email, :string
    add_column :candidates, :phone, :string
  end
end
