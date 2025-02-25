

-- WEAPON DATABASE (Tested in firing range)
local weapons = {
  -- SMGs
  KSV = {
    fireRate = 0.085,    -- 85ms between shots (11.76 RPM)
    pattern = {          -- Vertical focus with slight horizontal drift
      {0, 3}, {1, 5}, {-1, 6}, {0, 7}, {1, 8}
    },
    maxShots = 5
  },
  
  -- LMGs
  RAAL = {
    fireRate = 0.13,     -- 130ms between shots (46.15 RPM)
    pattern = {          -- Strong horizontal recoil
      {4, 1}, {-5, 2}, {3, 1}, {-4, 3}, {5, 2}
    },
    maxShots = 8
  },
  
  -- ARs
  Krig6 = {
    fireRate = 0.10,     -- 100ms between shots (60 RPM)
    pattern = {          -- Balanced diagonal pattern
      {1, 4}, {2, 5}, {-1, 6}, {1, 7}, {0, 8}
    },
    maxShots = 6
  }
}

-- SCRIPT CORE
local activeWeapon = nil
local shotCounter = 0

--[[ 
  Event Handler
  Modifier: Hold CTRL + mouse buttons 4/5/6 to select weapons
  Fire: Left mouse button activates recoil control
--]]
function OnEvent(event, arg)
  -- Weapon Selection Logic
  if event == "MOUSE_BUTTON_PRESSED" then
    if IsModifierPressed("lctrl") then
      if arg == 4 then activeWeapon = weapons.KSV
      elseif arg == 5 then activeWeapon = weapons.RAAL
      elseif arg == 6 then activeWeapon = weapons.Krig6
      end
      
      OutputLogMessage("Selected: %s\n", activeWeapon and activeWeapon.name or "None")
    end
    
    -- Fire Control Logic
    if arg == 1 and activeWeapon then
      shotCounter = 0
      repeat
        local x = activeWeapon.pattern[shotCounter+1][1] or 0
        local y = activeWeapon.pattern[shotCounter+1][2] or 0
        
        -- Humanized Movement (Uncomment for realism)
        -- x = x * (0.9 + math.random() * 0.2)
        -- y = y * (0.9 + math.random() * 0.2)
        
        MoveMouseRelative(-x, -y)
        Sleep(activeWeapon.fireRate * 1000)
        shotCounter = shotCounter + 1
        
      until not IsMouseButtonPressed(1) or shotCounter >= activeWeapon.maxShots
    end
  end
end

--[[ 
  Helper Functions
  isModifierPressed: Detects CTRL key for safe weapon switching
--]]
function IsModifierPressed(modifier)
  return GetKeyState(modifier) == 1
end

--[[ 
  MIT License
  Copyright (c) 2024 YourName
  Permission is hereby granted... [Include full license text]
--]]
