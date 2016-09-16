class Red101FormBuilder < ActionView::Helpers::FormBuilder
  SEPARATOR       = ' - '.freeze
  FIELD_CLASS     = 'field'.freeze
  ACTION_CLASS    = 'action'.freeze
  REQUIRED_CLASS  = 'required'.freeze
  BASIC_FIELDS    = %w(
    text_field
    number_field
    text_area
    email_field
    phone_field
    url_field
    password_field
    file_field
    collection_select
    collection_check_boxes
    check_box
  ).freeze

  delegate :content_tag, :tag, :capture, to: :@template

  BASIC_FIELDS.each do |method_name|
    define_method method_name do |name, *args, &block|
      options     = args.extract_options!
      label_text  = options.delete(:label) || object.class.human_attribute_name(name)
      label_error = Array.wrap(object.errors[name]).first
      label_text  = [label_text, label_error].compact.join(SEPARATOR)
      label_class = REQUIRED_CLASS if required?(name)
      content     = label(name, label_text, class: label_class) +
                    super(name, *args, options, &block)

      content_tag(:div, content, class: FIELD_CLASS)
    end
  end

  def submit(value = nil, options = {}, &block)
    content_tag(:div, super, class: ACTION_CLASS)
  end

  def base_errors
    content_tag(:div, object.errors[:base].first, class: :errors)
  end

  private

  def required?(name)
    object.class.validators_on(name).any? do |validator|
      validator.is_a?(ActiveModel::Validations::PresenceValidator)
    end
  end
end
