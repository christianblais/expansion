class Expansion::Value < ActiveRecord::Base
  
  set_table_name 'expansion_values'
  
  belongs_to :attribute, :class_name => "Expansion::Attribute"
  belongs_to :owner, :polymorphic => true
  
  scope :owned_by, lambda{ |owner| where( :owner_type => owner.class.name, :owner_id => owner.id ) }
  scope :for_attribute, lambda{ |attribute| where( :attribute_id => attribute.id ) }
  
  def value
    self.send("value_#{self.attribute.value_type}")
  end
  
  def value= x
    self.send("value_#{self.attribute.value_type}=", x)
  end
  
end
