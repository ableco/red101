class Authorization
  attr_reader :current_user

  def initialize(user, version = 1)
    if @current_user = user
      setup_rules(version)
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

    def setup_rules(version)
      case version
      when 1
        allow :profiles, :show

        if current_user.admin?
          allow :topics,    :create, :destroy
          allow :questions, :create
        end
      end
    end

    def allow(group, *permissions, &block)
      permissions.flatten.each do |permission|
        rules[group] ||= {}
        rules[group][permission] = (block || true)
      end
    end

    def rules
      @rules ||= {}
    end
end
