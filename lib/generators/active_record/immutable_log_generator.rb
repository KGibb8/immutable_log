require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class ImmutableLogGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def copy_immutable_log_migration
        migration_template "immutable_log_migration.rb", "db/migrate/create_immutable_log.rb"
      end
    end
  end
end

