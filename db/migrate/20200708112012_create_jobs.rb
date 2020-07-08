class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :location
      t.string :salary
      t.string :sector
      t.text :description

      t.timestamps
    end
  end
end
