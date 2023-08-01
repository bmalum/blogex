defmodule BlogexWeb.Layouts do
  use BlogexWeb, :html

  theme_name = Application.get_env(:blogex, :theme)
  embed_templates "../../../layouts/#{theme_name}/*"

#  embed_templates "layouts/*"
end
