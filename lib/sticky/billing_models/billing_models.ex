defmodule Sticky.BillingModels do
  import Sticky.Request

  defstruct [
    :offer_id,
    :billing_model_id
  ]

  @type t :: %__MODULE__{
    offer_id: pos_integer | nil
  }

  @spec billing_model_view(params) :: {:ok, t} | {:error, String.t()}
  when params: %{
         optional(:offer_id) => pos_integer,
         required(:billing_model_id) => pos_integer
       }
  def billing_model_view(%{offer_id: _offer_id} = params) do
    new()
    |> put_endpoint("/billing_model_view")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end

  def billing_model_view(%{billing_model_id: _billing_model_id} = params) do
    new()
    |> put_endpoint("/billing_model_view")
    |> put_method(:post)
    |> put_params(params)
    |> make_request()
  end
end
