# frozen_string_literal: true

module Vapi
  module Types
    class UpdateUserRoleDto < Internal::Types::Model
      field :user_id, -> { String }, optional: false, nullable: false, api_name: "userId"
      field :role, -> { Vapi::Types::UpdateUserRoleDtoRole }, optional: false, nullable: false
    end
  end
end
