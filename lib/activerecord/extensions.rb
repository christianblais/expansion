module Expansion
  module ActiveRecord
    def self.included base
      base.extend( ClassMethods )
    end

    module ClassMethods
      def expandable
        include InstanceMethods

        class << self
          def expansion_attributes
            Expansion::Attribute.where( :model_name => self.model_name )
          end
        end

        expandables << self
      end

      def expandables
        @expandables ||= []
      end
    end

    module InstanceMethods
      def expansion_attributes
        self.class.expansion_attributes.each_with_object({}) do |attribute, hash|
          hash[attribute.name] = attribute.values_for( self )
        end
      end
      
      def expansion_value attribute, value=nil, options={}
        if value
          Expansion::Value.new do |v|
            v.owner     = self
            v.attribute = attribute
            v.value     = value
            v.note      = options[:note]
            v.date      = options[:date]
          end.save!
        else
          attribute.values_for( self )
        end
      end
      alias_method :expansion_values, :expansion_value
    end
  end
end

ActiveRecord::Base.send( :include, Expansion::ActiveRecord )
