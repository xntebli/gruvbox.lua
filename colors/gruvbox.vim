lua << EOF
  package.loaded["gruvbox"] = nil
  package.loaded["gruvbox.colors"] = nil
  package.loaded["gruvbox.theme"] = nil
  package.loaded["gruvbox.util"] = nil

  require("gruvbox").load()
EOF
