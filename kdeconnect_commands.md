## macOS
| **Name** | **Command** |
|------------------|------------------------|
|**_Lock Screen_** |`pmset displaysleepnow` |
|**_Mute Mic_** |`osascript -e 'set volume input volume 0'` |
|**_UnMute Mic_** |`osascript -e 'set volume input volume 80'` |
|**_Mute Sound_** |`osascript -e 'set volume output muted true'` |
|**_UnMute Sound_** |`osascript -e 'set volume output muted false'` |
|**_Volume Up_** |`osascript -e 'set volume output volume (output volume of (get volume settings)+10)'` |
|**_Volume Down_** |`osascript -e 'set volume output volume (output volume of (get volume settings)-10)'` |
