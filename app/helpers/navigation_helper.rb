module NavigationHelper
  APP_NAME  = 'Red 101'.freeze
  SEPARATOR = ' / '.freeze

  def html_title
    safe_join([APP_NAME, tab_title(tab_key)], SEPARATOR)
  end

  def tab(key)
    link_to tab_title(key), key, class: %W(tab #{tab_state?(key)})
  end

  def tab_title(key)
    t("tabs.#{key}.title")
  end

  def tab_state?(key)
    tab_key == key ? :active : :inactive
  end

  def tab_key
    if search_tab?
      :search
    elsif diagnose_tab?
      :diagnose
    elsif configure_tab?
      :configure
    end
  end

  def search_tab?
    current_page?(controller: 'root', action: 'search')
  end

  def diagnose_tab?
    current_page?(controller: 'root', action: 'diagnose') ||
      'diagnostics' == controller_name &&
        %w(new create edit update).include?(action_name)
  end

  def configure_tab?
    current_page?(controller: 'root', action: 'configure') ||
      %w(devices profiles topics materials questions templates users).include?(controller_name)
  end
end
