json.extract! @user, :id, :name, :email
json.extract! @device, :token if @device
