module ApplicationHelper
  SEPARATOR      = ' / '.freeze
  ADMIN_SECTIONS = %i(materials questions topics templates users).freeze
  ACTIVE_CLASS   = 'active'.freeze
  INACTIVE_CLASS = 'inactive'.freeze

  def app_name
    'Red 101'
  end

  def title
    case section_key
    when :search  then nil
    when :profile then current_user.name
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
    name = User.human_attribute_name(key)
    info = user.public_send(key)

    if info.present?
      info_class = 'present'
    else
      info_class = 'blank'
      info       = t(:not_specified)
    end

    content_tag(:dt, name) + content_tag(:dd, info, class: info_class)
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
