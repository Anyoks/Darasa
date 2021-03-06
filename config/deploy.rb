# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'darasa'
set :repo_url, 'git@bitbucket.org:dennOrina/darasa.git'

set :passenger_restart_with_touch, true
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deploy/darasa'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :bundle_binstubs, nil
set :linked_files, %w{config/database.yml config/secrets.yml config/pesapal.yml config/initializers/devise.rb}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads public/assets/css public/assets/font-awesome public/assets/fonts 
	public/assets/img public/assets/js public/assets/sass public/css public/favicons public/fonts public/font-awesome public/images public/js}
# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

####*****setup sidekiq configs
set :sidekiq_role, :app  
set :sidekiq_config, "#{current_path}/config/sidekiq.yml"  
set :sidekiq_env, 'production' 

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :pty, false
set :sidekiq_monit_default_hooks, false

# Default value for keep_releases is 5
# set :keep_releases, 5
# amespace :deploy do

#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       execute :touch, release_path.join('tmp/restart.txt')
#     end
#   end

#   after :publishing, 'deploy:restart'
#   after :finishing, 'deploy:cleanup'
# end

#upload backup files
set :backup_path,"/home/#{fetch(:deploy)}/Backup"

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
