class RenameAnswerInAnswer < ActiveRecord::Migration
  def change
  	rename_column :answers, :answer, :response
  end
end
