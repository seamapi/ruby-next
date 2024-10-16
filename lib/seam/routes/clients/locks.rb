# frozen_string_literal: true

require "seam/helpers/action_attempt"

module Seam
  module Clients
    class Locks < BaseClient
      def get(device_id: nil, name: nil)
        request_seam_object(
          :post,
          "/locks/get",
          Seam::Resources::Device,
          "device",
          body: {device_id: device_id, name: name}.compact
        )
      end

      def list(connect_webview_id: nil, connected_account_id: nil, connected_account_ids: nil, created_before: nil, custom_metadata_has: nil, device_ids: nil, device_types: nil, exclude_if: nil, include_if: nil, limit: nil, manufacturer: nil, user_identifier_key: nil)
        request_seam_object(
          :post,
          "/locks/list",
          Seam::Resources::Device,
          "devices",
          body: {connect_webview_id: connect_webview_id, connected_account_id: connected_account_id, connected_account_ids: connected_account_ids, created_before: created_before, custom_metadata_has: custom_metadata_has, device_ids: device_ids, device_types: device_types, exclude_if: exclude_if, include_if: include_if, limit: limit, manufacturer: manufacturer, user_identifier_key: user_identifier_key}.compact
        )
      end

      def lock_door(device_id:, sync: nil, wait_for_action_attempt: nil)
        action_attempt = request_seam_object(
          :post,
          "/locks/lock_door",
          Seam::Resources::ActionAttempt,
          "action_attempt",
          body: {device_id: device_id, sync: sync}.compact
        )

        Helpers::ActionAttempt.decide_and_wait(action_attempt, @client, wait_for_action_attempt)
      end

      def unlock_door(device_id:, sync: nil, wait_for_action_attempt: nil)
        action_attempt = request_seam_object(
          :post,
          "/locks/unlock_door",
          Seam::Resources::ActionAttempt,
          "action_attempt",
          body: {device_id: device_id, sync: sync}.compact
        )

        Helpers::ActionAttempt.decide_and_wait(action_attempt, @client, wait_for_action_attempt)
      end
    end
  end
end
