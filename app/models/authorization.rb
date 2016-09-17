class Authorization
  Permissions = Class.new(SimpleDelegator)

  attr_reader :current_user

  def initialize(user, namespace = nil)
    @current_user = user
    namespace     = (namespace.presence || 'Application').delete(':')
    permissions   = "#{namespace}Permissions".constantize.new(self)

    permissions.apply
  end

  def authorized?(controller, action, resource = nil)
    rule = rules.dig(controller.to_sym, action.to_sym)

    if rule
      rule == true || resource && rule.call(resource)
    else
      false
    end
  end

  def authorize(controller, *actions, &block)
    actions.flatten.each { |action| rules[controller][action] = (block || true) }
  end

  private

  def rules
    @rules ||= Hash.new { |hash, key| hash[key] = {} }
  end
end
