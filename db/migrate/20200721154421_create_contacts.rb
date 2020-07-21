class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.string :company_name
      t.string :email
      t.integer :contact_number
      t.text :message

      t.timestamps
    end
  end
end
