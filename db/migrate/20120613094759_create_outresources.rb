class CreateOutresources < ActiveRecord::Migration
  def change
    create_table :outresources do |t|
      t.string :name
      t.text :descr

      t.timestamps
    end
  end
end
