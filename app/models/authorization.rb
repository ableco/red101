class Authorization
  attr_reader :current_user

  def initialize(user, version = 1)
    if @current_user = user
      setup_rules(version)
    end
  end

  def allow?(controller, action, resource = nil)
    if rule = rules.dig(controller.to_sym, action.to_sym)
      rule == true || object && rule.call(resource)
    else
      false
    end
  end

  private

    def v1_rules
      allow :profiles, :show

      if current_user.admin?
        allow :topics,    :create, :destroy
        allow :questions, :create
        allow :templates, :create
      end
    end

    def setup_rules(version)
      case version
      when 1 then v1_rules
      end
    end

    def allow(controller, *actions, &block)
      actions.flatten.each do |action|
        rules[controller] ||= {}
        rules[controller][action] = (block || true)
      end
    end

    def rules
      @rules ||= {}
    end
end
