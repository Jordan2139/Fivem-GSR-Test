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
        webhook = 'https://discord.com/api/webhooks/922252169279840306/oqoRi72y-wmY8eqGqbUHKrPBJIOBmORwGae76PHxXy1lVTBlKFElU6LVX6LKk1kS4SeD' -- Discord webhook URL
    },
}