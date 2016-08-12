require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  def setup
    @member = users(:member)
  end

  def test_default_invalid
    refute Device.new.valid?
  end

  def test_authentication_success
    device = Device.create(email: @member.email, password: PASSWORD)

    assert device.persisted?
  end

  def test_authentication_failure
    device = Device.create(email: @member.email, password: 'wrong')

    refute device.persisted?
  end
end
