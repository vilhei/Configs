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
- Turn off mouse acceleration

## Appearance
- Dark theme

## Multitaskin
- Hot Corner --> Disable


### Keyboard shortcuts
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
