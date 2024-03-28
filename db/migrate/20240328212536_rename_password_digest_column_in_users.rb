class RenamePasswordDigestColumnInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :password_digest_, :password_digest
  end
end
