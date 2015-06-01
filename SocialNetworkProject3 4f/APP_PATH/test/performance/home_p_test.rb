
require File.dirname(__FILE__) + '/../performance/home_p_test'
require File.dirname(__FILE__) + '/../test_helper'

class HomePTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
  #                          output: 'tmp/performance', formats: [:flat] }


  def setup
    # Application requires logged-in user
    @controller.sign_in @users
  end

  test "homepage" do
    get '/index'
  end

end

