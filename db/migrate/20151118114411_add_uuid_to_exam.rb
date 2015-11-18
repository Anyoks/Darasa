class AddUuidToExam < ActiveRecord::Migration
  def change
    add_column :exams, :uuid, :uuid, :default => "uuid_generate_v4()"
  end
end
