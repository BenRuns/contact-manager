class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|

    	t.string :first_name
    	t.string :last_name
  		t.string :middle_name
 		t.string :street_address
  		t.string :city
 		t.string :state
  		t.string :country
  		t.string :postal_code
 		t.string :phone_number
 		t.string :email
		t.timestamps


    end
    add_index :contacts, :email
    add_index :contacts, :first_name
    add_index :contacts, :last_name
    add_index :contacts, :phone_number
  end
end
