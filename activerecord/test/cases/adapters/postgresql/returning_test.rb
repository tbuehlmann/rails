# frozen_string_literal: true

require "cases/helper"
require "models/default"

class ReturningTest < ActiveRecord::TestCase
  def setup
    # modified_date defaults to `-> { "CURRENT_DATE" }`
    Default.returning = [:modified_date]
  end

  def teardown
    Default.returning = []
  end

  def test_setting_returning_database_default_values
    default = Default.create
    assert default.modified_date, Date.current
  end
end
