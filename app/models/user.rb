class User < ApplicationRecord
  attribute :name, :string
  has_secure_password
end
