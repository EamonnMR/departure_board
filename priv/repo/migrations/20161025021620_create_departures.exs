defmodule DepartureBoard.Repo.Migrations.CreateDepartures do
  use Ecto.Migration

  def change do
    create table(:departures) do
      add :time, :string
      add :origin, :string
      add :destination, :string
      add :train_number, :string
      add :track_number, :string
      add :status, :string

      timestamps()
    end

  end
end
