#threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
#threads threads_count, threads_count
#port        ENV.fetch("PORT") { 3000 }
#environment ENV.fetch("RAILS_ENV") { "development" }
#plugin :tmp_restart
workers Integer(ENV['WEB_CONCURRENCY'] ||2 )
threads_count = Integer(ENV['RALLS_MAX_THREADS']||5)
threads threads_count, threads_count

preload_app!

rackup DefaultRackup
port ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
    ActiveRecord::Base.establish_connection
end