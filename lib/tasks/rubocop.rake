if env['RAILS_ENV'] == 'development'
  require 'rubocop/rake_task'

  desc 'Run RuboCop on the project'
  Rubocop::RakeTask.new(:rubocop) do |task|
    task.patterns = ['**/*.rb']
    # only show the files with failures
    # task.formatters = ['files']
    # don't abort rake on failure
    task.fail_on_error = false
  end
end