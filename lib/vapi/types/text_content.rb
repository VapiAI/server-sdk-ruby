# frozen_string_literal: true

module Vapi
  module Types
    class TextContent < Internal::Types::Model
      field :type, -> { Vapi::Types::TextContentType }, optional: false, nullable: false
      field :text, -> { String }, optional: false, nullable: false
      field :language, -> { Vapi::Types::TextContentLanguage }, optional: false, nullable: false
    end
  end
end
