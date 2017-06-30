command: """
read -r running <<<"$(ps -ef | grep \"MacOS/iTunes\" | grep -v \"grep\" | wc -l)" &&
test $running != 0 &&
IFS='|' read -r theArtist theName theState <<<"$(osascript <<<'tell application "iTunes" to if player state is playing then 
        set theTrack to current track
        set theArtist to artist of theTrack
        set theName to name of theTrack
        set theState to player state as string
        return theArtist & " - " & "<span class='green'>" & theName & "</span>"
      else if player state is paused then
        return "<span class='white'>Paused</span>"
      else
        return "<span class='white'>Not Connected to iTunes</span>"
      end')" &&
echo "<span class='title white'>$theArtist</span><class='artist blue'> $theName</>"
"""

refreshFrequency: 10000

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="./colors.css" />
    <div class='playing'></div>
  """

style: """
  left: 12px
  bottom: 11px
  color: #fff
  height: 13
"""

render: (output) -> """
 <span class='playing'><span class='icon blue'> &nbsp</span></span><span class='white'>#{output}</span>
"""