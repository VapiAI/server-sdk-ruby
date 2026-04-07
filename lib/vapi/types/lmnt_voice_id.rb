# frozen_string_literal: true

module Vapi
  module Types
    # This is the provider-specific ID that will be used.
    class LmntVoiceId < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::LmntVoiceIdEnum }
      member -> { String }
    end
  end
end
