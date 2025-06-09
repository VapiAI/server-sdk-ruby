# frozen_string_literal: true

module Vapi
# Azure OpenAI doesn't support `maxLength` right now
#  -entra-id&pivots=programming-language-csharp#unsupported-type-specific-keywords.
#  Need to strip.
#  - `strip-parameters-with-unsupported-validation` will strip parameters with
#  unsupported validation.
#  - `strip-unsupported-validation` will keep the parameters but strip unsupported
#  validation.
#  @default `strip-unsupported-validation`
  class OpenAiModelToolStrictCompatibilityMode

    STRIP_PARAMETERS_WITH_UNSUPPORTED_VALIDATION = "strip-parameters-with-unsupported-validation"
    STRIP_UNSUPPORTED_VALIDATION = "strip-unsupported-validation"

  end
end