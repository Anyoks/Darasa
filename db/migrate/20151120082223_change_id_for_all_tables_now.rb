class ChangeIdForAllTablesNow < ActiveRecord::Migration
  def change
  	add_column :topics, :uuid, :uuid, :default => "uuid_generate_v4()"

 	remove_column :questions, :id , :cascade# remove existing primary key
 	rename_column :questions, :uuid, :id # rename existing UDID column
 	execute "ALTER TABLE questions ADD PRIMARY KEY (id);"

  	 	remove_column :exams, :id # remove existing primary key
  	 	rename_column :exams, :uuid, :id # rename existing UDID column
  	 	execute "ALTER TABLE exams ADD PRIMARY KEY (id);"

  	 	remove_column :units, :id # remove existing primary key
  	 	rename_column :units, :uuid, :id # rename existing UDID column
  	 	execute "ALTER TABLE units ADD PRIMARY KEY (id);"

  	 	remove_column :semesters, :id # remove existing primary key
  	 	rename_column :semesters, :uuid, :id # rename existing UDID column
  	 	execute "ALTER TABLE semesters ADD PRIMARY KEY (id);"

  	 	remove_column :years, :id # remove existing primary key
  	 	rename_column :years, :uuid, :id # rename existing UDID column
  	 	execute "ALTER TABLE years ADD PRIMARY KEY (id);"

  	 	remove_column :courses, :id # remove existing primary key
  	 	rename_column :courses, :uuid, :id # rename existing UDID column
  	 	execute "ALTER TABLE courses ADD PRIMARY KEY (id);"

  		remove_column :topics, :id # remove existing primary key
  	 	rename_column :topics, :uuid, :id # rename existing UDID column
  	 	execute "ALTER TABLE topics ADD PRIMARY KEY (id);"

  	 	remove_column :universities, :id # remove existing primary key
  	 	rename_column :universities, :uuid, :id # rename existing UDID column
  	 	execute "ALTER TABLE universities ADD PRIMARY KEY (id);"
  	 # remove_foreign_key :threads, :users
  end
end
