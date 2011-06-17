require 'rails/generators'
require 'rails/generators/migration'

module Expansion
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    
    source_root File.expand_path('../templates', __FILE__)
    
    desc "Expansion migrations Install"
    
    def self.next_migration_number dirname
      migration_number = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
      migration_number += 1
      migration_number.to_s
    end
    
    def create_migration_file
      migration_template 'create_expansion_attributes.rb', 'db/migrate/create_expansion_attributes.rb'
      sleep 1
      migration_template 'create_expansion_values.rb', 'db/migrate/create_expansion_values.rb'
    end
  end
end
