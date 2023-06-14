class ClientSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email
end
