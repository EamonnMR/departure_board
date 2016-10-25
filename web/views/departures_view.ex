defmodule DepartureBoard.DeparturesView do
  use DepartureBoard.Web, :view

  def render("index.json", %{departures: departures}) do
    %{data: render_many(departures, DepartureBoard.DeparturesView, "departures.json")}
  end

  def render("show.json", %{departures: departures}) do
    %{data: render_one(departures, DepartureBoard.DeparturesView, "departures.json")}
  end

  def render("departures.json", %{departures: departures}) do
    %{id: departures.id,
      time: departures.time,
      origin: departures.origin,
      destination: departures.destination,
      train_number: departures.train_number,
      track_number: departures.track_number,
      status: departures.status}
  end
end
