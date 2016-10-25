defmodule DepartureBoard.DeparturesTest do
  use DepartureBoard.ModelCase

  alias DepartureBoard.Departures

  @valid_attrs %{destination: "some content", origin: "some content", status: "some content", time: "some content", track_number: "some content", train_number: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Departures.changeset(%Departures{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Departures.changeset(%Departures{}, @invalid_attrs)
    refute changeset.valid?
  end
end
