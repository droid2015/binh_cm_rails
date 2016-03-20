class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :fullname
      t.string :phonenumber
      t.string :address
      t.string :description

      t.timestamps null: false
    end
  end
end
