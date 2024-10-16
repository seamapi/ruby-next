# frozen_string_literal: true

module Seam
  module Clients
    class AccessCodes < BaseClient
      def simulate
        @simulate ||= Seam::Clients::AccessCodesSimulate.new(self)
      end

      def unmanaged
        @unmanaged ||= Seam::Clients::AccessCodesUnmanaged.new(self)
      end

      def create(device_id:, allow_external_modification: nil, attempt_for_offline_device: nil, code: nil, common_code_key: nil, ends_at: nil, is_external_modification_allowed: nil, is_offline_access_code: nil, is_one_time_use: nil, max_time_rounding: nil, name: nil, prefer_native_scheduling: nil, preferred_code_length: nil, starts_at: nil, sync: nil, use_backup_access_code_pool: nil, use_offline_access_code: nil)
        request_seam_object(
          :post,
          "/access_codes/create",
          Seam::Resources::AccessCode,
          "access_code",
          body: {device_id: device_id, allow_external_modification: allow_external_modification, attempt_for_offline_device: attempt_for_offline_device, code: code, common_code_key: common_code_key, ends_at: ends_at, is_external_modification_allowed: is_external_modification_allowed, is_offline_access_code: is_offline_access_code, is_one_time_use: is_one_time_use, max_time_rounding: max_time_rounding, name: name, prefer_native_scheduling: prefer_native_scheduling, preferred_code_length: preferred_code_length, starts_at: starts_at, sync: sync, use_backup_access_code_pool: use_backup_access_code_pool, use_offline_access_code: use_offline_access_code}.compact
        )
      end

      def create_multiple(device_ids:, allow_external_modification: nil, attempt_for_offline_device: nil, behavior_when_code_cannot_be_shared: nil, code: nil, ends_at: nil, is_external_modification_allowed: nil, is_offline_access_code: nil, is_one_time_use: nil, max_time_rounding: nil, name: nil, prefer_native_scheduling: nil, preferred_code_length: nil, starts_at: nil, use_backup_access_code_pool: nil, use_offline_access_code: nil)
        request_seam_object(
          :post,
          "/access_codes/create_multiple",
          Seam::Resources::AccessCode,
          "access_codes",
          body: {device_ids: device_ids, allow_external_modification: allow_external_modification, attempt_for_offline_device: attempt_for_offline_device, behavior_when_code_cannot_be_shared: behavior_when_code_cannot_be_shared, code: code, ends_at: ends_at, is_external_modification_allowed: is_external_modification_allowed, is_offline_access_code: is_offline_access_code, is_one_time_use: is_one_time_use, max_time_rounding: max_time_rounding, name: name, prefer_native_scheduling: prefer_native_scheduling, preferred_code_length: preferred_code_length, starts_at: starts_at, use_backup_access_code_pool: use_backup_access_code_pool, use_offline_access_code: use_offline_access_code}.compact
        )
      end

      def delete(access_code_id:, device_id: nil, sync: nil)
        request_seam(
          :post,
          "/access_codes/delete",
          body: {access_code_id: access_code_id, device_id: device_id, sync: sync}.compact
        )

        nil
      end

      def generate_code(device_id:)
        request_seam_object(
          :post,
          "/access_codes/generate_code",
          Seam::Resources::AccessCode,
          "generated_code",
          body: {device_id: device_id}.compact
        )
      end

      def get(access_code_id: nil, code: nil, device_id: nil)
        request_seam_object(
          :post,
          "/access_codes/get",
          Seam::Resources::AccessCode,
          "access_code",
          body: {access_code_id: access_code_id, code: code, device_id: device_id}.compact
        )
      end

      def list(access_code_ids: nil, device_id: nil, user_identifier_key: nil)
        request_seam_object(
          :post,
          "/access_codes/list",
          Seam::Resources::AccessCode,
          "access_codes",
          body: {access_code_ids: access_code_ids, device_id: device_id, user_identifier_key: user_identifier_key}.compact
        )
      end

      def pull_backup_access_code(access_code_id:)
        request_seam_object(
          :post,
          "/access_codes/pull_backup_access_code",
          Seam::Resources::AccessCode,
          "backup_access_code",
          body: {access_code_id: access_code_id}.compact
        )
      end

      def update(access_code_id:, allow_external_modification: nil, attempt_for_offline_device: nil, code: nil, device_id: nil, ends_at: nil, is_external_modification_allowed: nil, is_managed: nil, is_offline_access_code: nil, is_one_time_use: nil, max_time_rounding: nil, name: nil, prefer_native_scheduling: nil, preferred_code_length: nil, starts_at: nil, sync: nil, type: nil, use_backup_access_code_pool: nil, use_offline_access_code: nil)
        request_seam(
          :post,
          "/access_codes/update",
          body: {access_code_id: access_code_id, allow_external_modification: allow_external_modification, attempt_for_offline_device: attempt_for_offline_device, code: code, device_id: device_id, ends_at: ends_at, is_external_modification_allowed: is_external_modification_allowed, is_managed: is_managed, is_offline_access_code: is_offline_access_code, is_one_time_use: is_one_time_use, max_time_rounding: max_time_rounding, name: name, prefer_native_scheduling: prefer_native_scheduling, preferred_code_length: preferred_code_length, starts_at: starts_at, sync: sync, type: type, use_backup_access_code_pool: use_backup_access_code_pool, use_offline_access_code: use_offline_access_code}.compact
        )

        nil
      end

      def update_multiple(common_code_key:, allow_external_modification: nil, code: nil, ends_at: nil, is_external_modification_allowed: nil, name: nil, prefer_native_scheduling: nil, starts_at: nil)
        request_seam(
          :post,
          "/access_codes/update_multiple",
          body: {common_code_key: common_code_key, allow_external_modification: allow_external_modification, code: code, ends_at: ends_at, is_external_modification_allowed: is_external_modification_allowed, name: name, prefer_native_scheduling: prefer_native_scheduling, starts_at: starts_at}.compact
        )

        nil
      end
    end
  end
end
