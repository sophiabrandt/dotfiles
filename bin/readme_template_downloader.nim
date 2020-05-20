# compile with `nim c -d:ssl readme_template.nim`

import httpclient, parseopt, os

proc downloadTemplate(link: string) =
  var client = newHttpClient()
  try:
    var file = open("README.md", fmWrite)
    defer: file.close()
    file.write(client.getContent(link))
    echo("Success - downloaded template to README.md.")
  except IOError as err:
    echo("Failed to download template: " & err.msg)

proc writeHelp() =
  echo """
  README Template Downloader 0.1.0 (download a README Template)
  Allowed arguments:
  - h | --help     : show help
  - v | --version  : show version
  - d | --default  : dowloads "BEST-README-Template"
  - m | --minimal  : dowloads from https://www.makeareadme.com/
  - t | --template : download link for template ("RAW")
  """

proc writeVersion() =
  echo "README Template Downloader 0.1.0"

proc cli*() =
  var url: string = "https://raw.githubusercontent.com/othneildrew/Best-README-Template/master/BLANK_README.md"

  if paramCount() == 0:
    writeHelp()
    quit(0)

  for kind, key, val in getopt():
    case kind
    of cmdLongOption, cmdShortOption:
      case key
      of "help", "h":
        writeHelp()
        quit()
      of "version", "v":
        writeVersion()
        quit()
      of "d", "default": discard
      of "m", "minimal": url = "https://gist.githubusercontent.com/sophiabrandt/0c68c821631e4203415f85043e29749f/raw/660b9a36f24a6cbd861f28ae861574c5a40b87f5/minimal-readme-template.md"
      of "t", "template": url = val
      else:
        discard
    else:
      discard

  downloadTemplate(url)

when isMainModule:
  cli()
