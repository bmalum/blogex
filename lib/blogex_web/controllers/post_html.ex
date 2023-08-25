defmodule BlogexWeb.PostHTML do
  use BlogexWeb, :html

  theme_name = Application.get_env(:blogex, :theme)
  path = :code.priv_dir(:blogex) 
  #embed_templates "#{path}/layouts//post_html/*"
  embed_templates "../layouts/#{theme_name}/*"
end
