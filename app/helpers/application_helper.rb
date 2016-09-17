module ApplicationHelper
  def destroy_options
    {
      method: :delete,
      data:   { confirm: t('.are_you_sure') }
    }
  end

  def link_to_visit(material)
    link_to material.title,
            visit_path(material.slug),
            target: '_blank',
            data:   { turbolinks: false }
  end

  def link_to_add_fields(label, form, association, container)
    new_object  = form.object.send(association).klass.new
    child_index = new_object.object_id
    fields      = build_fields_for(association, new_object, child_index)
    data        = { id: child_index, fields: fields, container: container }

    link_to(label, '#', class: 'add-fields', data: data)
  end

  def flash_message(key)
    content_tag(:div, flash[key], class: ['flash-message', key]) if flash[key].present?
  end

  private

  def build_fields_for(association, new_object, child_index)
    form.fields_for(association, new_object, child_index: child_index) do |f|
      render("#{association.to_s.singularize}_fields", form: f)
    end.delete("\n")
  end
end
