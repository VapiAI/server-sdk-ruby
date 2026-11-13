# frozen_string_literal: true

module Vapi
  module Types
    class TrafficTabMetricsWindowDto < Internal::Types::Model
      field :from, -> { String }, optional: false, nullable: false
      field :to, -> { String }, optional: false, nullable: false
      field :bucket, -> { Vapi::Types::TrafficTabMetricsWindowDtoBucket }, optional: false, nullable: false
    end
  end
end
