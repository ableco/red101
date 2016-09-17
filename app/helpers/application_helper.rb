module ApplicationHelper
  def profile_tab
    current_user ? :profile : :login
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

  def link_to_material(material)
    link_to material.title,
            visit_path(material.slug),
            target: '_blank',
            data: {
              turbolinks: false
            }
  end

  def link_to_add_fields(label, form, association, target_container)
    new_object  = form.object.send(association).klass.new
    child_index = new_object.object_id
    fields      = form.fields_for(association, new_object, child_index: child_index) do |f|
                    render("#{association.to_s.singularize}_fields", form: f)
                  end

    data = {
      id: child_index,
      fields: fields.delete("\n"),
      target_container: target_container,
      resource: new_object.class.name
    }

    link_to(label, '#', class: 'add-fields', data: data)
  end
end
