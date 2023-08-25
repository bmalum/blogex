defmodule BlogexWeb.Templates do
  use BlogexWeb, :html
  theme_name = Application.get_env(:blogex, :theme)
  embed_templates "../layouts/#{theme_name}/*"

  # attr :messenger, :string
end
