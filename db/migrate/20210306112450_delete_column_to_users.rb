class DeleteColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_columns :users, :first_name, :last_name, :address
  end
end
