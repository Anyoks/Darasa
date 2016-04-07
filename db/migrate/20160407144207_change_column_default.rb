class ChangeColumnDefault < ActiveRecord::Migration
  def change
  	institution = Institution.first
  	change_column_default :profiles, :institution_id, institution.id
  end
end
