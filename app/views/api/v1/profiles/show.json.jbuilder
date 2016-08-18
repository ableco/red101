json.extract! @user, :id, :first_name, :last_name, :email
json.extract! @device, :token if @device
