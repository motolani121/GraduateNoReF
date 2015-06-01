# test/benchmark_helper.rb
#
# Use this helper to write performance tests that benchmark requests in a more
# "production"-like context. This makes it easier to accurately measure the
# real-world gains of any performance optimisations.
#
# Performance tests run with this helper will run the tests in the "benchmark"
# environment, which differs from the "test" environment in the following ways:
#
#   * It behaves more like "production" (i.e. caching is enabled)
#   * It runs against the "development" database (i.e. a full data dump)
#   * The database is *not* rebuilt before the tests are run
#
# By enabling caching and running against the "development" database, we get a
# more accurate measure of how requests will actually perform in production
# with a full database is present.
#
# A rake task exists that will run these performance tests:
#
#  rake test:real_world_benchmarks
#
ENV["RAILS_ENV"] = "benchmark"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'rails/performance_test_help'

class ActionDispatch::PerformanceTest
  self.profile_options = { :runs => 5, :metrics => [:wall_time],
                           :output => 'tmp/performance', :formats => [:flat] }
end
class ActionController::TestCase
  include Devise::TestHelpers
end