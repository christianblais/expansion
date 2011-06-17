class Expansion::Attribute < ActiveRecord::Base

  set_table_name 'expansion_attributes'
  
  VALUE_TYPES = %w(boolean date float integer string text timestamp)
  
  has_many :values, :class_name => "Expansion::Value", :order => "created_at"

  validates :value_type, :presence => true, :inclusion => { :in => VALUE_TYPES }
  
  def values_for model
    v = self.values.owned_by( model )
    v = v.last unless self.is_multiple?
    v
  end
  
end
