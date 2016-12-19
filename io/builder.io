Builder := Object clone
Builder indentation := 0
Builder withIndentation := method(spaceCount,
  spaces := ""
  for(i,0,spaceCount,
  spaces = spaces .. " "
  )
  return(spaces)
)
Builder forward := method(
  writeln(self withIndentation( self indentation ), "<", call message name, ">")
  self indentation = self indentation + 1
  call message arguments foreach(
    arg, 
    content := self doMessage(arg); 
    if(content type == "Sequence", writeln(withIndentation(self indentation -1), content))
  )
  self indentation = self indentation - 1
  writeln(self withIndentation(self indentation), "</", call message name, ">")
  )

Builder div(
    h1("title")

  div(
    ul(
    li("Io"), 
    li("Lua"), 
    li("JavaScript")
    )
   )
 )
