# frozen_string_literal: true

module Vapi
  module Types
    class User < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
      field :email, -> { String }, optional: false, nullable: false
      field :full_name, -> { String }, optional: true, nullable: false, api_name: "fullName"
    end
  end
end
