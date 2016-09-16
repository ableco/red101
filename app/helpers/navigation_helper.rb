module NavigationHelper
  APP_NAME          = 'Red 101'.freeze
  SEPARATOR         = ' / '.freeze
  ADMIN_CONTROLLERS = %i(topics materials questions templates users).freeze

  def title
    if section_key == :profile
      current_user.name
    else
      t(section_key)
    end
  end

  def html_title
    safe_join([APP_NAME, title], SEPARATOR)
  end

  def active_tab?(condition)
    condition ? :active : :inactive
  end

  def admin_tabs
    content_tag(:nav, class: :tabs) do
      ADMIN_CONTROLLERS.map { |key| admin_tab(key) }.join.html_safe
    end
  end

  def admin_section?
    ADMIN_CONTROLLERS.include?(controller_name.to_sym)
  end

  def section_tab(key)
    link_to t("sections.#{key}"), key, class: ['section-tab', active_tab?(key == section_key)]
  end

  def admin_tab(key)
    link_to t("admin.#{key}"), key, class: ['admin-tab', active_tab?(key == controller_name.to_sym)]
  end

  def section_key
    if admin_section?
      :admin
    elsif current_user && controller_name != 'root'
      :profile
    elsif controller_name == 'profiles'
      :register
    elsif controller_name == 'devices'
      :login
    elsif current_page?(controller: 'root', action: 'search')
      :search
    end
  end
end
