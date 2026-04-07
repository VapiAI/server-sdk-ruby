# frozen_string_literal: true

module Vapi
  module Types
    # Body to include in the SIP request. Either a literal string body, or a JSON schema describing a structured body
    # that the model should populate.
    class UpdateSipRequestToolDtoBody < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { String }
      member -> { Vapi::Types::JsonSchema }
    end
  end
end
