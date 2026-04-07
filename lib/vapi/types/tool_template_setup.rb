# frozen_string_literal: true

module Vapi
  module Types
    class ToolTemplateSetup < Internal::Types::Model
      field :title, -> { String }, optional: false, nullable: false
      field :description, -> { String }, optional: true, nullable: false
      field :video_url, -> { String }, optional: true, nullable: false, api_name: "videoUrl"
      field :docs_url, -> { String }, optional: true, nullable: false, api_name: "docsUrl"
    end
  end
end
