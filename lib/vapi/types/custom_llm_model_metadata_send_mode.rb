# frozen_string_literal: true

module Vapi
  module Types
    module CustomLlmModelMetadataSendMode
      extend Vapi::Internal::Types::Enum

      OFF = "off"
      VARIABLE = "variable"
      DESTRUCTURED = "destructured"
    end
  end
end
