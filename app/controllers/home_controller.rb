# frozen_string_literal: true
class HomeController < ApplicationController
  layout "home"
  skip_before_action :authenticate_user!
  skip_authorization_check

  def show
    # This is the space ID. A space is like a project folder in Contentful terms
    space_id = 'developer_bookshelf'

    # This is the access token for this space. Normally you get both ID and the token in the Contentful web app
    access_token = '0b7f6x59a0'

    client = ContentfulService.call
    entry_id = '5PeGS2SoZGSa4GuiQsigQu'
    @entry = client.entry(entry_id)

    #puts "===================="
    #puts "Contentful content"
    #puts "#{entry.name} - by #{entry.author}"
    #puts "\t  #{entry.description}"
    #puts "===================="

    redirect_to(guest_dashboard_path) && return if current_user&.guest?
    redirect_to(admin_dashboard_path) && return if current_user
  end
end
