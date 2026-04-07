# frozen_string_literal: true

module Vapi
  module Types
    class ResponseTextDoneEvent < Internal::Types::Model
      field :content_index, -> { Integer }, optional: false, nullable: false
      field :item_id, -> { String }, optional: false, nullable: false
      field :output_index, -> { Integer }, optional: false, nullable: false
      field :text, -> { String }, optional: false, nullable: false
      field :type, -> { Vapi::Types::ResponseTextDoneEventType }, optional: false, nullable: false
    end
  end
end
