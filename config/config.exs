import Config

# somewhere in your config file
if Mix.env() == :dev do
config :advent_of_elixir, :git_hooks,
  auto_install: true,
  verbose: true,
  branches: [
    whitelist: [],
    blacklist: ["main"]
  ],
  hooks: [
    pre_commit: [
      tasks: [
        {:cmd, "mix format --check-formatted"}
      ]
    ],
    pre_push: [
      verbose: false,
      tasks: [
        {:cmd, "mix credo"},
        {:cmd, "mix test --color"},
        {:cmd, "echo 'success!'"}
      ]
    ]
  ]

end

import_config "#{config_env()}.exs"
