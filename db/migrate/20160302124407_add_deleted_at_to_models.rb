class AddDeletedAtToModels < ActiveRecord::Migration
	def change

		add_column :units, :deleted_at, :datetime
		add_index :units, :deleted_at
		

		
		add_column :users, :deleted_at, :datetime
		add_index :users, :deleted_at
		

		
		add_column :topics, :deleted_at, :datetime
		add_index :topics, :deleted_at
		

		
		add_column :subtopics, :deleted_at, :datetime
		add_index :subtopics, :deleted_at
		

		
		add_column :responses, :deleted_at, :datetime
		add_index :responses, :deleted_at
		

		
		add_column :courses, :deleted_at, :datetime
		add_index :courses, :deleted_at
		

		
		add_column :failed_payments, :deleted_at, :datetime
		add_index :failed_payments, :deleted_at
		

		
		add_column :payments, :deleted_at, :datetime
		add_index :payments, :deleted_at
		

		
		add_column :payment_activities, :deleted_at, :datetime
		add_index :payment_activities, :deleted_at
		

		
		add_column :purchases, :deleted_at, :datetime
		add_index :purchases, :deleted_at
		

		
		add_column :questions, :deleted_at, :datetime
		add_index :questions, :deleted_at
		

		
		add_column :question_activities, :deleted_at, :datetime
		add_index :question_activities, :deleted_at
		

		
		add_column :sms, :deleted_at, :datetime
		add_index :sms, :deleted_at
		

		
		add_column :semesters, :deleted_at, :datetime
		add_index :semesters, :deleted_at
		

		
		add_column :topic_activities, :deleted_at, :datetime
		add_index :topic_activities, :deleted_at
		

		
		add_column :unit_activities, :deleted_at, :datetime
		add_index :unit_activities, :deleted_at
		

		
		add_column :universities, :deleted_at, :datetime
		add_index :universities, :deleted_at
		

		
		add_column :years, :deleted_at, :datetime
		add_index :years, :deleted_at
		

		
		add_column :roles, :deleted_at, :datetime
		add_index :roles, :deleted_at
		

		
		add_column :prices, :deleted_at, :datetime
		add_index :prices, :deleted_at

	end
end
