require "./config/boot.rb"
require "./application"

Process.fork do
  exec "bundle exec linner watch"
end if settings.development?

map '/' do
  run Application
end
