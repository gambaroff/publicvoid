set :application, 'publicvoid'
set :repo_url, 'https://github.com/gambaroff/publicvoid.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

  set :deploy_to, '/home/ubuntu/publicvoid'
  set :scm, :git
  set :branch, "master"
  set :user, "ubuntu"
  set :rails_env, "production"
  set :deploy_via, :remote_cache
  set :ssh_options, { :forward_agent => true }
  

# set :format, :pretty
# set :log_level, :debug
  default_run_options[:pty] = true
  server "www.publicvoid.gambaroff.com", :app, :web, :db, :primary => true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :keep_releases, 2

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
