let prompt = {
  let color = if "SSH_CLIENT" in $env { "purple_bold" } else { "green_bold" }
  let directory = pwd | str replace $env.HOME "~"
  $"(ansi $color)($directory)(ansi reset)"
}

let completer = {|spans|
  carapace $spans.0 nushell ...$spans | from json
}

$env.CARAPACE_LENIENT = 1
$env.CARAPACE_MATCH = 1
$env.EDITOR = "hx"
$env.PROMPT_COMMAND = $prompt
$env.PROMPT_COMMAND_RIGHT = ""
$env.config.completions.external.completer = $completer
$env.config.footer_mode = "never"
$env.config.history.file_format = "sqlite"
$env.config.history.isolation = true
$env.config.show_banner = false
$env.config.table.trim.methodology = "truncating"
$env.config.table.trim.truncating_suffix = "..."
