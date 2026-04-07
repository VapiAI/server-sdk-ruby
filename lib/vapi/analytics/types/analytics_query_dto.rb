# frozen_string_literal: true

module Vapi
  module Analytics
    module Types
      class AnalyticsQueryDto < Internal::Types::Model
        field :queries, -> { Internal::Types::Array[Vapi::Types::AnalyticsQuery] }, optional: false, nullable: false
      end
    end
  end
end
