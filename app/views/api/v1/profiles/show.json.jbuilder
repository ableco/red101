json.extract! @user, :first_name, :last_name, :email
json.extract! @device, :token if @device
