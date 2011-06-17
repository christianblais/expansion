class CreateExpansionValues < ActiveRecord::Migration
  def self.up
    create_table :expansion_values do |t|
      t.references  :attribute
      t.references  :owner, :polymorphic => true
      t.text        :note
      t.date        :date
      
      t.string      :value_string
      t.integer     :value_integer
      t.float       :value_float
      t.date        :value_date
      t.timestamp   :value_timestamp
      t.text        :value_text
      t.boolean     :value_boolean

      t.timestamps
    end
  end

  def self.down
    drop_table :expansion_values
  end
end
