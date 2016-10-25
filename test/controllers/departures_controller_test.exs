defmodule DepartureBoard.DeparturesControllerTest do
  use DepartureBoard.ConnCase

  alias DepartureBoard.Departures
  @valid_attrs %{destination: "some content", origin: "some content", status: "some content", time: "some content", track_number: "some content", train_number: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, departures_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    departures = Repo.insert! %Departures{}
    conn = get conn, departures_path(conn, :show, departures)
    assert json_response(conn, 200)["data"] == %{"id" => departures.id,
      "time" => departures.time,
      "origin" => departures.origin,
      "destination" => departures.destination,
      "train_number" => departures.train_number,
      "track_number" => departures.track_number,
      "status" => departures.status}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, departures_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, departures_path(conn, :create), departures: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Departures, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, departures_path(conn, :create), departures: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    departures = Repo.insert! %Departures{}
    conn = put conn, departures_path(conn, :update, departures), departures: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Departures, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    departures = Repo.insert! %Departures{}
    conn = put conn, departures_path(conn, :update, departures), departures: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    departures = Repo.insert! %Departures{}
    conn = delete conn, departures_path(conn, :delete, departures)
    assert response(conn, 204)
    refute Repo.get(Departures, departures.id)
  end
end
