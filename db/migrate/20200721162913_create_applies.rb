class CreateApplies < ActiveRecord::Migration[6.0]
  def change
    create_table :applies do |t|
      t.string :full_name
      t.string :location

      t.timestamps
    end
  end
end
