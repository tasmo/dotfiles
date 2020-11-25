set color0  (xrdb -q -all | awk '/color0/  {print $2;}' | tr -d '#')
set color1  (xrdb -q -all | awk '/color1/  {print $2;}' | tr -d '#')
set color2  (xrdb -q -all | awk '/color2/  {print $2;}' | tr -d '#')
set color3  (xrdb -q -all | awk '/color3/  {print $2;}' | tr -d '#')
set color4  (xrdb -q -all | awk '/color4/  {print $2;}' | tr -d '#')
set color5  (xrdb -q -all | awk '/color5/  {print $2;}' | tr -d '#')
set color6  (xrdb -q -all | awk '/color6/  {print $2;}' | tr -d '#')
set color7  (xrdb -q -all | awk '/color7/  {print $2;}' | tr -d '#')
set color8  (xrdb -q -all | awk '/color8/  {print $2;}' | tr -d '#')
set color9  (xrdb -q -all | awk '/color9/  {print $2;}' | tr -d '#')
set color10 (xrdb -q -all | awk '/color10/ {print $2;}' | tr -d '#')
set color11 (xrdb -q -all | awk '/color11/ {print $2;}' | tr -d '#')
set color12 (xrdb -q -all | awk '/color12/ {print $2;}' | tr -d '#')
set color13 (xrdb -q -all | awk '/color13/ {print $2;}' | tr -d '#')
set color14 (xrdb -q -all | awk '/color14/ {print $2;}' | tr -d '#')
set color15 (xrdb -q -all | awk '/color15/ {print $2;}' | tr -d '#')

set -x fish_color_normal            $color15 # the default color
set -x fish_color_command           $color12 # the color for commands
set -x fish_color_quote             $color7  # the color for quoted blocks of text
set -x fish_color_redirection       $color6  # the color for IO redirections
set -x fish_color_end               $color14 # the color for process separators like ';' and '&'
set -x fish_color_error             $color9  # the color used to highlight potential errors
set -x fish_color_param             $color3  # the color for regular command parameters
set -x fish_color_comment           $color7  # the color used for code comments
set -x fish_color_match             $color10 # the color used to highlight matching parenthesis
set -x fish_color_search_match      $color2  # the color used to highlight history search matches
set -x fish_color_operator          $color13 # the color for parameter expansion operators like '*' and '~'
set -x fish_color_escape            $color5  # the color used to highlight character escapes like '\n' and '\x70'
set -x fish_color_cwd               $color14 # the color used for the current working directory in the default prompt
set -x fish_color_autosuggestion    $color8  # the color used for autosuggestions
set -x fish_color_user              $color11 # the color used to print the current username in some of fish default prompts
set -x fish_color_host              $color2  # the color used to print the current host system in some of fish default prompts
set -x fish_color_cancel            $color1  # the color for the '^C' indicator on a canceled command

set -x fish_pager_color_prefix      $color8  # the color of the prefix string, i.e. the string that is to be completed
set -x fish_pager_color_completion  $color7  # the color of the completion itself
set -x fish_pager_color_description $color8  # the color of the completion description
set -x fish_pager_color_progress    $color4  # the color of the progress bar at the bottom left corner
set -x fish_pager_color_secondary   $color0  # the background color of the every second completion
