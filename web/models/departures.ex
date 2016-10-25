defmodule DepartureBoard.Departures do
  use DepartureBoard.Web, :model

  schema "departures" do
    field :time, :string
    field :origin, :string
    field :destination, :string
    field :train_number, :string
    field :track_number, :string
    field :status, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:time, :origin, :destination, :train_number, :track_number, :status])
    |> validate_required([:time, :origin, :destination, :train_number, :track_number, :status])
  end
end
