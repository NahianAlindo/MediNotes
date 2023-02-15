# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"
# server '3.110.177.190', port: 22, roles: [:web, :app, :db], primary:true
set :application, "MediNotes"
set :repo_url, "git@github.com:NahianAlindo/MediNotes.git"

set :rbenv_ruby, '2.6.5'
set :default_env, {path: "~/.rbenv/shims:~/.rbenv/bin:$PATH"}

set :user, 'ubuntu'
set :puma_threads, [4,16]
set :puma_workers, 0
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
# set :npm_flags, '--silent --no-progress'
# set :npm_target_path, -> { release_path.join('client') }
# set :npm_roles, :all
#
# append :linked_dirs, 'client/node_modules'
# append :linked_dirs, 'public/packs'

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true
set :use_sudo, true
set :branch, 'master'
set :stage, :production

set :linked_files, %w{config/master.key config/database.yml}
set :rails_env, 'production'
set :keep_releases, 2
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :linked_files, %w{config/database.yml config/master.key}

set :deploy_via, :remote_cache
set :deploy_to, "/home/ubuntu/#{fetch(:application)}"
set :puma_bind, "unix://#{shared_path}/tmp/sockets//#{fetch(:application)}-puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log, "#{release_path}/log/puma.error.log"
set :ssh_options, {forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub)}
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true

# set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }

append :rbenv_map_bins, 'puma', 'pumactl'

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before 'deploy:starting', 'puma:make_dirs'
end

namespace :deploy do
  desc "Make sure local git is in sync with remote"
  # task :check_revision  do
  #   on roles(:app) do
  #     unless 'git rev-parse HEAD' == 'git rev-parse github/master'
  #       puts 'WARNING: HEAD is not the same as github/master'
  #       puts "Run 'git push' to sync changes."
  #       exit
  #     end
  #   end
  # end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  # before :starting, :check_revision
  after :finishing, :compile_assets
  after :finishing, :cleanup

end
# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
