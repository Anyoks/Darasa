class ChangeIdForQuestion < ActiveRecord::Migration
  def change
  	 	# remove_column :questions, :id , :cascade# remove existing primary key
  	 	# rename_column :questions, :uuid, :id # rename existing UDID column
  	 	# execute "ALTER TABLE questions ADD PRIMARY KEY (id);"

  	 # 	remove_column :exams, :id # remove existing primary key
  	 # 	rename_column :exams, :uuid, :id # rename existing UDID column
  	 # 	execute "ALTER TABLE exams ADD PRIMARY KEY (id);"

  	 # 	remove_column :unit, :id # remove existing primary key
  	 # 	rename_column :unit, :uuid, :id # rename existing UDID column
  	 # 	execute "ALTER TABLE unit ADD PRIMARY KEY (id);"

  	 # 	remove_column :semesters, :id # remove existing primary key
  	 # 	rename_column :semesters, :uuid, :id # rename existing UDID column
  	 # 	execute "ALTER TABLE semesters ADD PRIMARY KEY (id);"

  	 # 	remove_column :year, :id # remove existing primary key
  	 # 	rename_column :year, :uuid, :id # rename existing UDID column
  	 # 	execute "ALTER TABLE year ADD PRIMARY KEY (id);"

  	 # 	remove_column :courses, :id # remove existing primary key
  	 # 	rename_column :courses, :uuid, :id # rename existing UDID column
  	 # 	execute "ALTER TABLE courses ADD PRIMARY KEY (id);"

  		# remove_column :topics, :id # remove existing primary key
  	 # 	rename_column :topics, :uuid, :id # rename existing UDID column
  	 # 	execute "ALTER TABLE topics ADD PRIMARY KEY (id);"

  	 # 	remove_column :universities, :id # remove existing primary key
  	 # 	rename_column :universities, :uuid, :id # rename existing UDID column
  	 # 	execute "ALTER TABLE universities ADD PRIMARY KEY (id);"
  	 # remove_foreign_key :threads, :users
  	 remove_foreign_key "cats", "units"
  	 remove_foreign_key "courses", "universities"
  	 remove_foreign_key "exams", "units"
  	 remove_foreign_key "payments", "exams"
  	 remove_foreign_key "payments", "semesters"
  	 remove_foreign_key "payments", "units"
  	 remove_foreign_key "questions", "exams"
  	 remove_foreign_key "responses", "questions"
  	 remove_foreign_key "semesters", "years"
  	 remove_foreign_key "topics", "units"
  	 remove_foreign_key "units", "semesters"
  	 # remove_foreign_key "users", "roles"
  	 remove_foreign_key "years", "courses"
  end
end
