class RemoveBookFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :users, :book
  end
end
