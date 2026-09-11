# frozen_string_literal: true

module Vapi
  module Types
    # A directed connection between two workflow nodes, with an optional AI-evaluated transition condition.
    class Edge < Internal::Types::Model
      field :condition, -> { Vapi::Types::AiEdgeCondition }, optional: true, nullable: false
      field :from, -> { String }, optional: false, nullable: false
      field :to, -> { String }, optional: false, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
