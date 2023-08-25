defmodule BlogexWeb.BlogHTML do
  use BlogexWeb, :html

  theme_name = Application.get_env(:blogex, :theme)
  # embed_templates "../../../layouts/#{theme_name}/blog_html/*"
  #embed_templates "../../../priv/layouts/#{theme_name}/blog_html/*"
  embed_templates "../layouts/#{theme_name}/*"

#   embed_templates "blog_html/*"
end
