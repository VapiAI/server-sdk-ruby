# frozen_string_literal: true

module Vapi
  module Files
    module Types
      class UpdateFileDto < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :name, -> { String }, optional: true, nullable: false
      end
    end
  end
end
