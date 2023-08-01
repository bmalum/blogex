defmodule BlogexWeb.PostHTML do
  use BlogexWeb, :html

  theme_name = Application.get_env(:blogex, :theme)

  embed_templates "../../../layouts/#{theme_name}/post_html/*"
#  embed_templates "blog_html/*"
end
