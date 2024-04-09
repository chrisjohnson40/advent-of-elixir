import Config

# somewhere in your config file
config :git_hooks,
  auto_install: true,
  verbose: true,
  branches: [
    whitelist: ["feature/.*", "bugfix/.*"],
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
