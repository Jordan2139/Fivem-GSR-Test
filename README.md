# FiveM Gun Shot Residue Test
## What is it? 
FiveM Gun Shot Residue Test is a very simple and un-original script that I had to fix for Astra. I figured I'd throw my version on here for no other reason than to justify my existence in the FiveM community. I'm still here and can still barley write LUA but I guess I'm trying. 

## Configuration 
```
Config = {
    GSRAutoClean = 900, -- Amount of time before you are autocleaned (In Seconds)
    GSRTestDistance = 3, -- Max distace the command can be used to
    TestGSR = "gsr", -- Command To Test For GSR
    cleargsr = 'washgsr', -- Command to clean off GSR
    forceclean = 'forcewh', -- Command to force clean off the GSR (LOGGED)
    Perms = {
        restricted = false, -- Would you like to restrict the forceclean to a ace perm?
        forceperm = 'GSR:ForceClean', -- Ace perm to be able to force clean
    },
    Logging = {
        enabled = true, -- Enable logging of forceclean
        webhook = 'https://discord.com/api/webhooks/WEBHOOK_ID/WEBHOOK_SECRET' -- Discord webhook URL
    },
}
```

## Acknowledgments
Astra - Failed to make the original version so I had to step in

## Photos
![](https://cdn.jordan2139.me/ultraleaks98276.png)

![](https://cdn.jordan2139.me/ultraleaks81339.png)

![](https://cdn.jordan2139.me/ultraleaks97154.png)

![](https://cdn.jordan2139.me/ultraleaks57180.png)
