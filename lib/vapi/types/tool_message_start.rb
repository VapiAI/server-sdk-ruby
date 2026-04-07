# frozen_string_literal: true

module Vapi
  module Types
    class ToolMessageStart < Internal::Types::Model
      field :contents, -> { Internal::Types::Array[Vapi::Types::TextContent] }, optional: true, nullable: false
      field :blocking, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :content, -> { String }, optional: true, nullable: false
      field :conditions, -> { Internal::Types::Array[Vapi::Types::Condition] }, optional: true, nullable: false
    end
  end
end
