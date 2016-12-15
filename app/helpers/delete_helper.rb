# frozen_string_literal: true

# This helper only works if you have a to_s defined in the resource model
module DeleteHelper
  def data_to_delete(resource)
    {
      data: {
        id: resource.id,
        url: url_for(resource),
        name: resource.to_s,
        cancel: t("views.cancel"),
        confirm: t("views.destroy"),
        title: t("views.confirm_title"),
        text: t("views.confirm_text", type: resource.class.model_name.human)
      }
    }
  end
end
