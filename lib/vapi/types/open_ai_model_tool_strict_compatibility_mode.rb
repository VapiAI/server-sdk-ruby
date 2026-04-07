# frozen_string_literal: true

module Vapi
  module Types
    module OpenAiModelToolStrictCompatibilityMode
      extend Vapi::Internal::Types::Enum

      STRIP_PARAMETERS_WITH_UNSUPPORTED_VALIDATION = "strip-parameters-with-unsupported-validation"
      STRIP_UNSUPPORTED_VALIDATION = "strip-unsupported-validation"
    end
  end
end
