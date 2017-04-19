# frozen_string_literal: true
module ContentfulService
  module_function

  def call

    space_id = Rails.application.secrets.contentful_space_id
    access_token = Rails.application.secrets.contentful_access_token
    puts "========="
    puts "Contentful"
    puts space_id
    puts "========="

    @client ||= Contentful::Client.new(
      access_token: access_token,
      space: space_id,
      dynamic_entries: :auto,
      raise_errors: true
    )
  end
end
