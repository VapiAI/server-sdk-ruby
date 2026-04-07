# frozen_string_literal: true

module Vapi
  module Types
    class File < Internal::Types::Model
      field :object, -> { Vapi::Types::FileObject }, optional: true, nullable: false
      field :status, -> { Vapi::Types::FileStatus }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :original_name, -> { String }, optional: true, nullable: false, api_name: "originalName"
      field :bytes, -> { Integer }, optional: true, nullable: false
      field :purpose, -> { String }, optional: true, nullable: false
      field :mimetype, -> { String }, optional: true, nullable: false
      field :key, -> { String }, optional: true, nullable: false
      field :path, -> { String }, optional: true, nullable: false
      field :bucket, -> { String }, optional: true, nullable: false
      field :url, -> { String }, optional: true, nullable: false
      field :parsed_text_url, -> { String }, optional: true, nullable: false, api_name: "parsedTextUrl"
      field :parsed_text_bytes, -> { Integer }, optional: true, nullable: false, api_name: "parsedTextBytes"
      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      field :id, -> { String }, optional: false, nullable: false
      field :org_id, -> { String }, optional: false, nullable: false, api_name: "orgId"
      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
