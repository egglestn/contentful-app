# frozen_string_literal: true
class HomeController < ApplicationController
  layout "home"
  skip_before_action :authenticate_user!
  skip_authorization_check

  def show
    client = ContentfulService.call
    entry_id = "5PeGS2SoZGSa4GuiQsigQu"
    @entry = client.entry(entry_id)

    redirect_to(guest_dashboard_path) && return if current_user&.guest?
    redirect_to(admin_dashboard_path) && return if current_user
  end
end
