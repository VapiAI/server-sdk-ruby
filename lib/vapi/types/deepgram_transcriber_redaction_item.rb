# frozen_string_literal: true

module Vapi
  module Types
    module DeepgramTranscriberRedactionItem
      extend Vapi::Internal::Types::Enum

      PCI = "pci"
      PII = "pii"
      PHI = "phi"
      NUMBERS = "numbers"
    end
  end
end
