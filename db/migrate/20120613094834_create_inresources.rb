class CreateInresources < ActiveRecord::Migration
  def change
    create_table :inresources do |t|
      t.string :name
      t.text :descr
      t.references :outresource

      t.timestamps
    end
    add_index :inresources, :outresource_id
  end
end
