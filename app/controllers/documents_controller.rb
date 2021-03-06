# frozen_string_literal: true
class DocumentsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
    if @document.save
      redirect_to @document, notice: t("controller.success.create", name: @document.title)
    else
      render :new
    end
  end

  def update
    if @document.update(document_params)
      redirect_to @document, notice: t("controller.success.update", name: @document.title)
    else
      render :edit
    end
  end

  def destroy
    @document.destroy
    redirect_to documents_url, notice: t("controller.success.destroy", name: @document.title)
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def document_params
    params.require(:document).permit(:title, :file)
  end
end
