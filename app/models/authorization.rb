class Authorization
  attr_reader :current_user

  def initialize(user)
    @current_user = user
  end

  def allow(group, *permissions, &block)
    permissions.flatten.each do |permission|
      rules[group] ||= {}
      rules[group][permission] = (block || true)
    end
  end

  def allow?(group, permission, object = nil)
    if rule = rules[group] && rules[group][permission]
      rule == true || object && rule.call(object)
    else
      false
    end
  end

  private

    def rules
      @rules ||= {}
    end
end
