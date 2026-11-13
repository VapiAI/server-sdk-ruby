# frozen_string_literal: true

module Vapi
  module Types
    class GetToolDraftsDto < Internal::Types::Model
      field :cursor, -> { String }, optional: true, nullable: false
      field :limit, -> { Integer }, optional: true, nullable: false
      field :created_by, -> { String }, optional: true, nullable: false, api_name: "createdBy"
    end
  end
end
