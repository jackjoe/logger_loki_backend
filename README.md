# LoggerLokiBackend

A shameless plug to the stale LokiLogger, with PR's pulled in and personal tweaks.
See the [Legacy](LEGACY.md) file for more info.

## Installation

The package can be installed by adding `logger_loki_backend` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:logger_loki_backend, "~> 0.3.0"}
  ]
end
```

## Configuration

### Elixir Project

The behavior is controlled using the application configuration environment:

- **loki_host** : the hostname of the syslog server e.g. http://localhost:3100
- **loki_path** : the path to push to e.g. /api/v1/push
- **loki_labels** : the Loki log labels used to select the log stream in e.g. Grafana
- **loki_scope_org_id**: optional tenant ID for multitenancy. Currently not (yet?) supported in Grafana when enforced with `auth_enabled: true` in Loki config
- **level**: logging threshold. Messages "above" this threshold will be discarded. The supported levels, ordered by precedence are :debug, :info, :warn, :error.
- **format**: the format message used to print logs. Defaults to: "$metadata level=$level $levelpad$message". It may also be a {module, function} tuple that is invoked with the log level, the message, the current timestamp and the metadata.
- **metadata**: the metadata to be printed by $metadata. Defaults to to :all, which prints all metadata.
- **max_buffer**: the amount of entries to buffer before posting to the Loki REST api. Defaults to 32.

For example, the following `config/config.exs` file sets up Loki Logger using
level debug, with `application` label `loki_logger_library`.

```elixir
use Mix.Config

config :logger,
       backends: [LoggerLokiBackend]

config :logger, :logger_loki_backend,
       level: :debug,
       format: "$metadata level=$level $levelpad$message",
       metadata: :all,
       max_buffer: 300,
       loki_labels: %{application: "logger_loki_backend", elixir_node: node()},
       loki_host: "http://localhost:3100"
```

# Protobuff lib regeneration

only needed for development

```shell script
protoc --proto_path=./lib/proto --elixir_out=./lib lib/proto/loki.proto
```
