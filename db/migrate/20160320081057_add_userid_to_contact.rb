class AddUseridToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :userid, :integer
  end
end
