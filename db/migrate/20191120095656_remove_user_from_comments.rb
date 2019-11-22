class RemoveUserFromComments < ActiveRecord::Migration[6.0]
  def change

    remove_column :comments, :user, :string
  end
end
