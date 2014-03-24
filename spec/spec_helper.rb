require 'simplecov'
require 'rspec'
require 'coveralls'

Coveralls.wear!

# Automagically include all helpers/*_helper.rb

base = Pathname(__FILE__).dirname.expand_path
Dir.glob(base + 'helpers/*_helper.rb').each do |file|
  require file
end

RSpec.configure do |config|
  include BlueprintHelper
  include CliHelper
  include ConnectionHelper
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
  # add_filter 'spec/'
  # add_filter 'test/'

  add_group 'Bricks', 'lib/gooddata/bricks'
  add_group 'CLI', 'lib/gooddata/cli'
  add_group 'Commands', 'lib/gooddata/commands'
  add_group 'Commands', 'lib/gooddata/core'
  add_group 'Commands', 'lib/gooddata/exceptions'
  add_group 'Commands', 'lib/gooddata/extensions'
  add_group 'Goodzilla', 'lib/gooddata/goodzilla'
  add_group 'Models', 'lib/gooddata/models'
end
