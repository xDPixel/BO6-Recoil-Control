# BO6 Recoil Control Script for Logitech G502 Lightspeed

## 🚀 Overview
This script automates recoil control for BO6 on PC using Logitech G-Hub. It is optimized for specific weapons and tested in the in-game firing range.

⚠️ **Use at your own risk.**

---

## 🛠️ How to Use
1. **Install Logitech G-Hub** (Required for script execution).
2. **Load the .lua script** in G-Hub’s scripting section.
3. **Select a weapon** by holding `CTRL` and pressing one of the mouse buttons:
   - `Mouse Button 4` → KSV (SMG)
   - `Mouse Button 5` → RAAL (LMG)
   - `Mouse Button 6` → Krig6 (AR)
4. **Fire with Left Mouse Button** → The script will automatically control recoil.
5. **Emergency Stop** → Press `CTRL+SHIFT+ESC` to terminate all scripts instantly.

---

## 🔧 Customization
### **Code Customization for Desired Recoil Control**
To modify the script to fit your specific needs, adjust the following values in the `weapons` table:

- **Fire Rate:** Modify the `fireRate` value for each weapon to change the shooting speed (measured in seconds between shots).
- **Recoil Pattern:** Edit the `pattern` array to define how the script compensates for vertical and horizontal recoil.
  - Example: `{0, 3}, {1, 5}, {-1, 6}` → Moves mouse accordingly.
- **Max Shots:** Change the `maxShots` value to determine how many shots the recoil control applies to before stopping.
- **Humanized Movement:** Uncomment the section below in the script for slight randomization in movement, making the recoil control more natural:
  ```lua
  -- x = x * (0.9 + math.random() * 0.2)
  -- y = y * (0.9 + math.random() * 0.2)
  ```

---

## ⚠️ Important Notes
### **Anti-Cheat Warning**
⚠️ **User Responsibility Warning** ⚠️
- This script operates under user discretion and responsibility.
- It does not modify game files, inject code, or exploit vulnerabilities; it only automates mouse movements.
- This script is **not a cheat**, but its usage cannot guarantee immunity from potential penalties or bans.
- The developer is not responsible for any consequences resulting from its use.

### **Pattern Testing**
- Validate the script’s effect in BO6’s firing range with these settings:
  - `Options > Gameplay > "Recoil Wall" = Enabled`
  - Set game FPS to **60 FPS** for accurate recording.

### **Optimal Performance**
- Recommended Krig6 AR setup:
  - **Monolithic Suppressor + Commando Foregrip**

---

## 📜 License
This script is released under the **MIT License**. You are free to modify and distribute it.

---

### 📌 Disclaimer
This script is for **educational purposes only**. The author is not responsible for any misuse leading to bans or account penalties.
