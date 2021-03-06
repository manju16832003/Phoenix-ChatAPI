defmodule HelloPhoenix.Message do
  use HelloPhoenix.Web, :model
@derive {Poison.Encoder, only: [:id, :body]}
  schema "message" do
    field :body, :string
    belongs_to :room, HelloPhoenix.Room, foreign_key: :room_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body, :room_id])
    |> validate_required([:body, :room_id])
  end
end
