# frozen_string_literal: true

module Vapi
  module Types
    class GladiaCustomVocabularyConfigDtoVocabularyItem < Internal::Types::Model
      extend Vapi::Internal::Types::Union

      member -> { String }
      member -> { Vapi::Types::GladiaVocabularyItemDto }
    end
  end
end
