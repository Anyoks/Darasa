class AddTermsUpdatedAtToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :terms_updated_at, :timestamp #, null: false
  end
end
