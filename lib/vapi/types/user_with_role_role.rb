# frozen_string_literal: true

module Vapi
  module Types
    # This is the user's role in the org: a built-in role, the HIPAA special role, or a custom WorkOS role slug prefixed
    # with `org-`.
    class UserWithRoleRole < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::UserWithRoleRoleZero }
      member -> { String }
    end
  end
end
