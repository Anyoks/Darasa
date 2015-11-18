class AddUuidToSemester < ActiveRecord::Migration
  def change
    add_column :semesters, :uuid, :uuid, :default => "uuid_generate_v4()"
  end
end
