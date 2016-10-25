defmodule DepartureBoard.DeparturesController do
  use DepartureBoard.Web, :controller

  alias DepartureBoard.Departures

  def index(conn, _params) do
    departures = Repo.all(Departures)
    render(conn, "index.json", departures: departures)
  end

  def create(conn, %{"departures" => departures_params}) do
    changeset = Departures.changeset(%Departures{}, departures_params)

    case Repo.insert(changeset) do
      {:ok, departures} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", departures_path(conn, :show, departures))
        |> render("show.json", departures: departures)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DepartureBoard.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    departures = Repo.get!(Departures, id)
    render(conn, "show.json", departures: departures)
  end

  def update(conn, %{"id" => id, "departures" => departures_params}) do
    departures = Repo.get!(Departures, id)
    changeset = Departures.changeset(departures, departures_params)

    case Repo.update(changeset) do
      {:ok, departures} ->
        render(conn, "show.json", departures: departures)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DepartureBoard.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    departures = Repo.get!(Departures, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(departures)

    send_resp(conn, :no_content, "")
  end
end
