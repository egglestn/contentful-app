# frozen_string_literal: true
module Developers
  class DevelopmentsController < ApplicationController
    load_and_authorize_resource :developer
    load_and_authorize_resource :development, through: [:developer]

    def index
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
      if @development.save
        redirect_to [@developer, @development], notice: "Development was successfully created."
      else
        render :new
      end
    end

    def update
      if @development.update(development_params)
        redirect_to [@developer, @development], notice: "Development was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @development.destroy
      redirect_to [@developer, @developments], notice: "Development was successfully destroyed."
    end

    private

    # Never trust parameters from the scary internet, only allow the white list through.
    def development_params
      params.require(:development).permit(
        :development_name,
        :developer_id,
        :division_id,
        :office_address,
        :city,
        :county,
        :postcode,
        :email,
        :contact_number
      )
    end
  end
end