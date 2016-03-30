class AddLevelOfStudyToProfiles < ActiveRecord::Migration
  def change
  	add_column :profiles, :level, :hstore, default: {}
  	add_index :profiles, :level, name: 'profiles_level_idx', using: :gin
  end
end
