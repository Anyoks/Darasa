class AddCountryToInstitution < ActiveRecord::Migration
  def change
    add_column :institutions, :country, :string
  end
end