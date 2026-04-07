# frozen_string_literal: true

module Vapi
  module Campaigns
    class Client
      # @param client [Vapi::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String, nil] :id
      # @option params [Vapi::Campaigns::Types::CampaignControllerFindAllRequestStatus, nil] :status
      # @option params [Integer, nil] :page
      # @option params [Vapi::Campaigns::Types::CampaignControllerFindAllRequestSortOrder, nil] :sort_order
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :created_at_gt
      # @option params [String, nil] :created_at_lt
      # @option params [String, nil] :created_at_ge
      # @option params [String, nil] :created_at_le
      # @option params [String, nil] :updated_at_gt
      # @option params [String, nil] :updated_at_lt
      # @option params [String, nil] :updated_at_ge
      # @option params [String, nil] :updated_at_le
      #
      # @return [Vapi::Types::CampaignPaginatedResponse]
      def campaign_controller_find_all(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[id status page sort_order limit created_at_gt created_at_lt created_at_ge created_at_le updated_at_gt updated_at_lt updated_at_ge updated_at_le]
        query_params = {}
        query_params["id"] = params[:id] if params.key?(:id)
        query_params["status"] = params[:status] if params.key?(:status)
        query_params["page"] = params[:page] if params.key?(:page)
        query_params["sortOrder"] = params[:sort_order] if params.key?(:sort_order)
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["createdAtGt"] = params[:created_at_gt] if params.key?(:created_at_gt)
        query_params["createdAtLt"] = params[:created_at_lt] if params.key?(:created_at_lt)
        query_params["createdAtGe"] = params[:created_at_ge] if params.key?(:created_at_ge)
        query_params["createdAtLe"] = params[:created_at_le] if params.key?(:created_at_le)
        query_params["updatedAtGt"] = params[:updated_at_gt] if params.key?(:updated_at_gt)
        query_params["updatedAtLt"] = params[:updated_at_lt] if params.key?(:updated_at_lt)
        query_params["updatedAtGe"] = params[:updated_at_ge] if params.key?(:updated_at_ge)
        query_params["updatedAtLe"] = params[:updated_at_le] if params.key?(:updated_at_le)
        params.except(*query_param_names)

        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "campaign",
          query: query_params,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::CampaignPaginatedResponse.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [Vapi::Campaigns::Types::CreateCampaignDto]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Vapi::Types::Campaign]
      def campaign_controller_create(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "campaign",
          body: Vapi::Campaigns::Types::CreateCampaignDto.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::Campaign.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Vapi::Types::Campaign]
      def campaign_controller_find_one(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "campaign/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::Campaign.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Vapi::Types::Campaign]
      def campaign_controller_remove(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "campaign/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::Campaign.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [Vapi::Campaigns::Types::UpdateCampaignDto]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Vapi::Types::Campaign]
      def campaign_controller_update(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request_data = Vapi::Campaigns::Types::UpdateCampaignDto.new(params).to_h
        non_body_param_names = ["id"]
        body = request_data.except(*non_body_param_names)

        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "campaign/#{URI.encode_uri_component(params[:id].to_s)}",
          body: body,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::Campaign.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
