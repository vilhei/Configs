# config.nu
#
# Installed by:
# version = "0.108.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R


source ~/.zoxide.nu

use std/log

$env.config.buffer_editor = "hx"
$env.HELIX_RUNTIME = "~/workspace/tools/helix/runtime"
$env.config

let default_completer = {|spans|
    carapace $spans.0 nushell ...$spans | from json
}


def "nu-complete zoxide path" [context: string] {
    let parts = $context | split row " " | skip 1
    {
      options: {
        sort: false,
        completion_algorithm: substring,
        case_sensitive: false,
      },
      completions: (^zoxide query --list --exclude $env.PWD -- ...$parts | lines),
    }
  }

def --env --wrapped z [...rest: string@"nu-complete zoxide path"] {
  __zoxide_z ...$rest
}


let multiple_completers = {|spans|
    # let expanded_alias = (scope aliases | where name == $spans.0 | get -o 0 | get -o expansion)

    # let spans = (if $expanded_alias != null  {
    #     $spans | skip 1 | prepend ($expanded_alias | split words)
    # } else { $spans })
    match $spans.0 {
        _ => $default_completer
    } | do $in $spans

}

$env.config.completions.external.enable = true
$env.config.completions.external.completer = $multiple_completers 


mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
