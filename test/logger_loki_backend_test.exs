defmodule LoggerLokiBackendTest do
  use ExUnit.Case
  doctest LoggerLokiBackend
  require Logger

  test "greets the world" do
    Logger.info("Sample message")
    Logger.debug("Sample message")
    Logger.error("Sample message")
    Logger.info("Sample message")
    Logger.debug("Sample message")
    Logger.error("Sample message")
    Logger.info("Sample message")
    Logger.debug("Sample message")
    Logger.warn("Sample message")
    Logger.flush()
  end

  test "benchmark" do
    Benchee.run(
      %{
        "debug" => fn -> Logger.debug("Sample message") end
      },
      time: 4,
      parallel: 2
    )
  end
end
