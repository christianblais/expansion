class CreateExpansionAttributes < ActiveRecord::Migration
  def self.up
    create_table :expansion_attributes do |t|
      t.string  :model_name
      t.string  :name
      t.string  :value_type
      t.boolean :is_multiple

      t.timestamps
    end
  end

  def self.down
    drop_table :expansion_attributes
  end
end
