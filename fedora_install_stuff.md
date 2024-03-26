# Fedora guide

## Install fedora
- Use Fedora media writer to write iso to usb drive.
- Install fedora
- Remember to choose correct keyboard layout

## Install zsh
```shell
sudo dnf install zsh
```

## Install oh-my-zsh
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Install VsCode
Install key and repository
```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
```

Update package cacge and install VsCode
```
dnf check-update
sudo dnf install code 
```

## Update zshrc
update ~/.zshrc content with contentc of https://github.com/vilhei/Configs/blob/main/.zshrc

## Install oh-my-posh
```
curl -s https://ohmyposh.dev/install.sh | bash -s
```
Install a font required for all symbols
```
oh-my-posh font install
```
Select Meslo
Change terminal font to `MesloLGM Nerd Font`

## Normal fedora settings
- **Mouse & Touchpad**
    - Turn off mouse acceleration


- **Appearance**
    - Dark theme

- **Multitasking**
    - Hot Corner --> Disable


- **Keyboard shortcuts**
- Disable Accessibility/Turn screen reader on or off
- Navigation/hide all normal windows --> Super+D
- Navigation/switch windows --> alt+tab
- Navigation/switch system controls --> disable
- System/show the notification list --> disable
- Custom Shortcuts/Terminal --> gnome-terminal --> ctrl+alt+t

## Gnome Tweaks
### Install 
```
sudo dnf install gnome-tweaks
```
### Settings
- Enable minimize button for windows
- Add Terminal to startup applications


## Firefox 
- Change theme to dark
- 

### addons
- Bitwarden


## Software
Remove
- Cheese
- Connections
- Contacts
- Document Scanner
- Maps
- Rhythmbox
- Tour
- Weather


## Update Fedora
```
sudo dnf update
```

## Gnome keybindings
List all keybindings
```
gsettings list-recursively org.gnome.desktop.wm.keybindings
```

Change switching workspace up and down

```
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Control><Alt><Shift>Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Control><Alt><Shift>Up']"
```


## Gnome Extensions
https://extensions.gnome.org/

- [Dash to dock](https://extensions.gnome.org/extension/307/dash-to-dock/)
- [clipboard history](https://extensions.gnome.org/extension/4839/clipboard-history/)
    - Change shortcut to Super+V
- [launch new instance](https://extensions.gnome.org/extension/600/launch-new-instance/)
- [just perfection](https://extensions.gnome.org/extension/3843/just-perfection/)
    - Visibility/Activites button -->  Disable
    - Visibility/Weather -->  Disable
    - Behavior/Window Demands Attention Focus --> Enable
- [vitals](https://extensions.gnome.org/extension/1460/vitals/)

