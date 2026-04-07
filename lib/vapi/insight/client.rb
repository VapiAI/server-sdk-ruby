# frozen_string_literal: true

module Vapi
  module Insight
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
      # @option params [Integer, nil] :page
      # @option params [Vapi::Insight::Types::InsightControllerFindAllRequestSortOrder, nil] :sort_order
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
      # @return [Vapi::Types::InsightPaginatedResponse]
      def insight_controller_find_all(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        query_param_names = %i[id page sort_order limit created_at_gt created_at_lt created_at_ge created_at_le updated_at_gt updated_at_lt updated_at_ge updated_at_le]
        query_params = {}
        query_params["id"] = params[:id] if params.key?(:id)
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
          path: "reporting/insight",
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
          Vapi::Types::InsightPaginatedResponse.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [Vapi::Insight::Types::InsightControllerCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Vapi::Insight::Types::InsightControllerCreateResponse]
      def insight_controller_create(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "reporting/insight",
          body: Vapi::Insight::Types::InsightControllerCreateRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Insight::Types::InsightControllerCreateResponse.load(response.body)
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
      # @return [Vapi::Insight::Types::InsightControllerFindOneResponse]
      def insight_controller_find_one(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "reporting/insight/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Insight::Types::InsightControllerFindOneResponse.load(response.body)
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
      # @return [Vapi::Insight::Types::InsightControllerRemoveResponse]
      def insight_controller_remove(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "reporting/insight/#{URI.encode_uri_component(params[:id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Insight::Types::InsightControllerRemoveResponse.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [Vapi::Insight::Types::InsightControllerUpdateRequestBody]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Vapi::Insight::Types::InsightControllerUpdateResponse]
      def insight_controller_update(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[id]
        body_params = params.except(*path_param_names)

        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PATCH",
          path: "reporting/insight/#{URI.encode_uri_component(params[:id].to_s)}",
          body: Vapi::Insight::Types::InsightControllerUpdateRequestBody.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Insight::Types::InsightControllerUpdateResponse.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [Vapi::Insight::Types::InsightRunDto]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Vapi::Types::InsightRunResponse]
      def insight_controller_run(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request_data = Vapi::Insight::Types::InsightRunDto.new(params).to_h
        non_body_param_names = ["id"]
        body = request_data.except(*non_body_param_names)

        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "reporting/insight/#{URI.encode_uri_component(params[:id].to_s)}/run",
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
          Vapi::Types::InsightRunResponse.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @param request_options [Hash]
      # @param params [Vapi::Insight::Types::InsightControllerPreviewRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Vapi::Types::InsightRunResponse]
      def insight_controller_preview(request_options: {}, **params)
        params = Vapi::Internal::Types::Utils.normalize_keys(params)
        request = Vapi::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "reporting/insight/preview",
          body: Vapi::Insight::Types::InsightControllerPreviewRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Vapi::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Vapi::Types::InsightRunResponse.load(response.body)
        else
          error_class = Vapi::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
