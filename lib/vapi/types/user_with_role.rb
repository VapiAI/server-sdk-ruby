# frozen_string_literal: true

module Vapi
  module Types
    class UserWithRole < Internal::Types::Model
      field :role, -> { Vapi::Types::UserWithRoleRole }, optional: false, nullable: false
      field :last_active_at, -> { String }, optional: true, nullable: false, api_name: "lastActiveAt"
      field :id, -> { String }, optional: false, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :email, -> { String }, optional: false, nullable: false
      field :full_name, -> { String }, optional: true, nullable: false, api_name: "fullName"
    end
  end
end
