class Authorization
  def initialize(user, version = 1)
    @current_user = user
    setup_rules(version) if user
  end

  def authorized?(controller, action, resource = nil)
    rule = rules.dig(controller.to_sym, action.to_sym)

    if rule
      rule == true || resource && rule.call(resource)
    else
      false
    end
  end

  private

    def v1_rules
      authorize :profiles,    :show
      authorize :diagnostics, :create

      if @current_user.admin?
        authorize :topics,    %i(create destroy)
        authorize :questions, :create
        authorize :templates, :create
      end
    end

    def setup_rules(version)
      case version
      when 1 then v1_rules
      end
    end

    def authorize(controller, *actions, &block)
      actions.flatten.each do |action|
        rules[controller] ||= {}
        rules[controller][action] = (block || true)
      end
    end

    def rules
      @rules ||= {}
    end
end
