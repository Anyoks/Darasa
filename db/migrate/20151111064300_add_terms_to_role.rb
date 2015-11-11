class AddTermsToRole < ActiveRecord::Migration
  def change
    add_column :roles, :terms, :boolean, :default => false
  end
end
