defmodule DiscogsEx.Client do
  defstruct auth: nil, endpoint: "https://api.discogs.com/"

  @type auth :: %{key: nil, secret: nil}
  @type t :: %__MODULE__{auth: auth, endpoint: binary}

  @spec new() :: t
  def new(), do: %__MODULE__{}

  @spec new(auth) :: t
  def new(auth),  do: %__MODULE__{auth: auth}

  @spec new(auth, binary) :: t
  def new(auth, endpoint) do
    endpoint = if String.ends_with?(endpoint, "/") do
      endpoint
    else
      endpoint <> "/"
    end
    %__MODULE__{auth: auth, endpoint: endpoint}
  end
end
