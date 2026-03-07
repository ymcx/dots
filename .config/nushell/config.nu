$env.CARAPACE_MATCH = 1
$env.EDITOR = "hx"
$env.PROMPT_COMMAND_RIGHT = ""
$env.config.completions.external.completer = {|spans| carapace $spans.0 nushell ...$spans | from json}
$env.config.history.file_format = "sqlite"
$env.config.history.isolation = true
$env.config.show_banner = false
