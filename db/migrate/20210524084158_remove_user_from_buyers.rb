class RemoveUserFromBuyers < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :items, :users
    remove_reference :items, :user, index: true
  end
end
