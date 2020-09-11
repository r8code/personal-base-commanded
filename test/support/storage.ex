defmodule PersonalBase.Storage do

  def reset! do
    :ok = Application.stop(:personal_base)

    reset_eventstore!()
    # reset_readstore!()

    {:ok, _} = Application.ensure_all_started(:personal_base)
  end

  defp reset_eventstore! do
    {:ok, conn} =
      PersonalBase.EventStore.config()
      |> EventStore.Config.default_postgrex_opts()
      |> Postgrex.start_link()
    EventStore.Storage.Initializer.reset!(conn)
  end

  defp reset_readstore! do
    {:ok, conn} = Postgrex.start_link(PersonalBase.Repo.config())
    Postgrex.query!(conn, truncate_readstore_tables(),[])
  end

  defp truncate_readstore_tables do
    """
    TRUNCATE TABLE
      projection_versions
    RESTART IDENTITY;
    """
  end
end
