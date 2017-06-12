# config valid only for Capistrano 3.1
lock '3.8.1'

set :application, 'aigor'
set :repo_url, 'https://github.com/francho/aigor.git'
set :branch, 'master'

# Capistrano-rails gem
set :rails_env, 'production'

# nvm
set :nvm_type, :user # or :system, depends on your nvm setup
set :nvm_node, 'v6.10.2'
set :nvm_map_bins, %w{node npm yarn nvm-exec}
# set :nvm_custom_path, '$HOME/.nvm'

# Capistrano-rbenv gem
set :rbenv_ruby, File.read('.ruby-version').strip

# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

# Capistrano-bundler gem
set :bundle_without, %w{development test darwin}.join(' ')


# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, false

# Default value for :linked_files is []
set :linked_files, %w{config/aigor.yml config/secrets.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/cache}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 3

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      # within release_path do
      #   # execute :rake, 'cache:clear'
      #   command %[kill -s USR1 $(cat tmp/pids/server.pid)]
      # end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:app), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
