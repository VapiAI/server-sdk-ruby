# frozen_string_literal: true

module Vapi
  module Types
    # This is the provider-specific ID that will be used.
    class AzureVoiceId < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { Vapi::Types::AzureVoiceIdEnum }
      member -> { String }
    end
  end
end
