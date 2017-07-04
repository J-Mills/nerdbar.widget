command: """
read -r running <<<"$(ps -ef | grep \"MacOS/iTunes\" | grep -v \"grep\" | wc -l)" &&
test $running != 0 &&
IFS='|' read -r theArtist theName theState theStream <<<"$(osascript <<<'if application "iTunes" is running then
  tell application "iTunes"
    if player state is playing then
      set theTrack to name of current track
      set theArtist to artist of current track
      return theArtist & " - " & "<span class='green'>" & theTrack
    else if player state is paused then
      set theTrack to name of current track
      set theArtist to artist of current track
      return theArtist & " - " & "<span class='green'>" & theTrack & "<span class='white'>" & " - paused"
    else
      return "no song selected"
    end if
  end tell
else
  return "iTunes is not running"
end if')" &&
echo "$theArtist $theName"
"""

refreshFrequency: 10000

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="./colors.css" />
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