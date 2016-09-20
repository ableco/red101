class ApplicationPermissions < Authorization::Permissions
  REST_ACTIONS = %i(new create index show edit update destroy).freeze

  def apply
    authorize_guest
    authorize_user  if current_user
    authorize_admin if current_user&.admin?
  end

  private

  def authorize_guest
    authorize :users,       %i(new create)
    authorize :diagnostics, %i(new create)
    authorize :diagnostics, %i(show edit update) do |diagnostic|
      diagnostic.annonymous?
    end
  end

  def authorize_user
    authorize :materials, %i(index)

    authorize :users, %i(show edit update destroy) do |user|
      current_user == user
    end

    authorize :diagnostics, %i(show edit update destroy) do |diagnostic|
      current_user.id == diagnostic.user_id
    end
  end

  def authorize_admin
    authorize :topics,      REST_ACTIONS
    authorize :templates,   REST_ACTIONS
    authorize :questions,   REST_ACTIONS
    authorize :users,       REST_ACTIONS
    authorize :materials,   REST_ACTIONS
    authorize :diagnostics, REST_ACTIONS
  end
end
