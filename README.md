# information
a) to use this in studio, you could create a `ModuleScript` and put the `src.lua` contents or just paste it within your own script

b) if you want to use this for exploit environment development, just simply make an http request to the raw `src.lua` contents file or paste it within the script and use from there

```lua
timer:start( )
timer:stop( )
timer:restart( )
```

# exploit environment usage
```lua
local timerLib = loadstring( game:HttpGetAsync( 'https://raw.githubusercontent.com/networktraffic/timer/main/src.lua' ) )( )
local exampleTimer = timerLib.new( )

exampleTimer:start( )
task.wait( 3 )
exampleTimer:stop( )

print( exampleTimer.finishedTime )

exampleTimer:restart( )
task.wait( 2 )
exampleTimer:stop( )

print( exampleTimer.finishedTime )
```
