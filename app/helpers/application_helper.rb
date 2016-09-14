module ApplicationHelper
  def destroy_options
    {
      method: :delete,
      data: {
        confirm: t('.are_you_sure')
      }
    }
  end
end
