local animationBackup = {animation = nil, frame = nil}
function OnTick()
    local playerBiped = blam.biped(get_dynamic_player())
    if (playerBiped and playerBiped.flashlightKey and playerBiped.isOnGround) then
        animationBackup = {animation = playerBiped.animation, frame = playerBiped.animationFrame}
        playerBiped.animation = 113
        playerBiped.animationFrame = 5
        playerBiped.xVel = playerBiped.xVel + (playerBiped.cameraX * 0.15)
        playerBiped.yVel = playerBiped.yVel + (playerBiped.cameraY * 0.15)
        --playerBiped.zVel = (playerBiped.cameraZ * 0.1)
    end
    if (animationBackup) then
        playerBiped.animation = 113
    end
    if (playerBiped.animation == 113 and playerBiped.animationFrame == 33 and animationBackup) then
        playerBiped.animation = animationBackup.animation
        --playerBiped.animationFrame = animationBackup.frame
        playerBiped.animationFrame = 0
        animationBackup = nil
    end
end
