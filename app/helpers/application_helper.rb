module ApplicationHelper
  SEPARATOR      = ' / '.freeze
  ADMIN_SECTIONS = %i(materials questions topics templates users).freeze
  ACTIVE_CLASS   = 'active'.freeze
  INACTIVE_CLASS = 'inactive'.freeze

  def app_name
    'Red 101'
  end

  def title
    if section_key == :profile
      current_user.name
    else
      t(section_key)
    end
  end

  def title_separator
    SEPARATOR
  end

  def admin_section?
    ADMIN_SECTIONS.include?(controller_name.to_sym)
  end

  def active_tab?(condition)
    condition ? ACTIVE_CLASS : INACTIVE_CLASS
  end

  def section_tab(key)
    link_to t(key), key, class: ['section-tab', active_tab?(key == section_key)]
  end

  def admin_tab(key)
    link_to t(key), key, class: ['admin-tab', active_tab?(key == controller_name.to_sym)]
  end

  def profile_info(user, key)
    attr_name = User.human_attribute_name(key)
    attr_info = user.public_send(key)

    if attr_info.present?
      attr_css  = 'present'
    else
      attr_css  = 'blank'
      attr_info = t(:not_specified)
    end

    content_tag(:dt, attr_name, class: attr_css) + content_tag(:dd, attr_info, class: attr_css)
  end

  def destroy_options
    {
      method: :delete,
      data: {
        confirm: t('.are_you_sure')
      }
    }
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

  def link_to_result(result)
    link_to result.title,
            go_path(result.slug),
            target: '_blank',
            data: {
              turbolinks: false
            }
  end
end
