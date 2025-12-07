# Copy Lapse Files and Code - Instructions

## Files to Download/Copy

### From PSFree900 Repository (Lapse Exploit):
1. **lapse.js** - The Lapse kernel exploit code
   - URL: https://raw.githubusercontent.com/ciss84/PSFree900/main/lapse.js

2. **psfree.js** - PSFree framework code
   - URL: https://raw.githubusercontent.com/ciss84/PSFree900/main/psfree.js

3. **loader.js** - Payload loader
   - URL: https://raw.githubusercontent.com/ciss84/PSFree900/main/loader.js

### From psphive-lapse-2 Repository:
4. **psphive_index.html** - PSPhive UI with Lapse integration
   - URL: https://raw.githubusercontent.com/neo305/psphive-lapse-2/main/index.html

## Scripts Created

1. **fetch_lapse_all.ps1** - Downloads all Lapse files
2. **copy_lapse_to_agent.ps1** - Copies files to agent_backup directory

## Manual Download Steps

1. Run the fetch script:
   ```powershell
   powershell -ExecutionPolicy Bypass -File fetch_lapse_all.ps1
   ```

2. Or download manually using the URLs above

3. Copy files to your desired "other Agent" location using:
   ```powershell
   powershell -ExecutionPolicy Bypass -File copy_lapse_to_agent.ps1
   ```

## Current Status

- Scripts created: ✓
- Files downloaded: ⚠ (Check manually)
- Files copied: ⚠ (Run copy script after download)
