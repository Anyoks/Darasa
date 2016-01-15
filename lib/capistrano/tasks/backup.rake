namespace :backup do

  desc "Upload backup config files."
  task :upload_config do
    on roles(:deploy) do
      execute "mkdir -p #{fetch(:backup_path)}/models"
      upload! StringIO.new(File.read("config/backup/config.rb")), "#{fetch(:backup_path)}/config.rb"
      upload! StringIO.new(File.read("config/backup/models/exams_backup.rb")), "#{fetch(:backup_path)}/models/exams_backup.rb"
      upload! StringIO.new(File.read("config/backup/models/questions_backup.rb")), "#{fetch(:backup_path)}/models/questions_backup.rb"
      upload! StringIO.new(File.read("config/backup/models/responses_backup.rb")), "#{fetch(:backup_path)}/models/responses_backup.rb"
      upload! StringIO.new(File.read("config/backup/models/units_backup.rb")), "#{fetch(:backup_path)}/models/units_backup.rb"
    end
  end

  desc "Upload cron schedule file."
  task :upload_cron do
    on roles(:deploy) do
      execute "mkdir -p /home/deploy/Backup/config"
      execute "touch /home/deploy/Backup/config/cron.log"
      upload! StringIO.new(File.read("config/backup/schedule.rb")), "/home/deploy/Backup/config/schedule.rb"

      within "#{fetch(:backup_path)}" do
        # capistrano was unable to find the executable for whenever
        # without the path to rbenv shims set
        #with path: "/home/#{fetch(:deploy_user)}/.rbenv/shims:$PATH" do
         puts capture :whenever
          puts capture :whenever, '--update-crontab'
        #end
      end
    end
  end

end