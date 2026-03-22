let prompt = {
  let color = if (is-admin) {
    "red"
  } else if "INVOCATION_ID" in $env {
    "blue"
  } else if "SSH_CLIENT" in $env {
    "purple"
  } else {
    "green"
  }

  (ansi ($color)_bold)(pwd | str replace $env.HOME "~")(ansi reset)
}

let completer = {|spans|
  carapace $spans.0 nushell ...$spans | from json
}

$env.CARAPACE_MATCH = 1
$env.EDITOR = "hx"
$env.PROMPT_COMMAND = $prompt
$env.PROMPT_COMMAND_RIGHT = ""
$env.config.completions.external.completer = $completer
$env.config.history.file_format = "sqlite"
$env.config.history.isolation = true
$env.config.show_banner = false

def play [] {
  for file in (ls | shuffle) {
    print $file.name
    ffplay $file.name -autoexit -nodisp -loglevel quiet
  }
}
