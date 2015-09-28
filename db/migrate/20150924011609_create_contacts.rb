class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :business_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone1
      t.string :phone2
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
