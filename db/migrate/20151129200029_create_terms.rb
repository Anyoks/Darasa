class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms, id: :uuid do |t|
      t.text :terms
    end
  end
end
