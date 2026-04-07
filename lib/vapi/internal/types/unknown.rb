# frozen_string_literal: true

module Vapi
  module Internal
    module Types
      module Unknown
        include Vapi::Internal::Types::Type

        def coerce(value)
          value
        end
      end
    end
  end
end
