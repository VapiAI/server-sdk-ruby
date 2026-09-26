# frozen_string_literal: true

module Vapi
  module Types
    class VoiceLibraryVoiceResponseAge < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { String }
      member -> { Integer }
    end
  end
end
