defmodule Blogex.AWS do

    def client() do
        client = %AWS.Client{
        access_key_id: System.get_env("AWS_ACCESS_KEY_ID"),
        secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY"),
        session_token: System.get_env("AWS_SESSION_TOKEN"),
        region: "eu-west-1"
        }
    end
end