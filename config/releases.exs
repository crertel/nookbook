import Config

name = "mnesia2f"

config :libcluster,
  topologies: [
    nook_book: [
      strategy: Cluster.Strategy.Epmd,
      config: [
        hosts: [
          :"nook_book@10.0.1.192",
          :"nook_book@10.0.1.252"
        ]
      ]
    ]
  ]

config :nook_book,
  cluster_role: System.get_env("CLUSTER_ROLE", "member") |> String.to_atom(),
  base_uri: "http://#{name}.nookbook.online"

config :nook_book, NookBookWeb.Endpoint,
  server: true,
  http: [port: 4000],
  url: [host: "#{name}.nookbook.online"],
  secret_keybase: "05RTlIyB3HMbNpEeINxIAV3rOcEFHAivnniKMbqCD9i6NRD/XGquZJNt60kxsQR1"
