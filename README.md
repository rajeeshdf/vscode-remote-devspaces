# VS Code Remote Development in DevSpaces

Read more about remote development support in VS Code https://code.visualstudio.com/docs/remote/remote-overview

### Prerequisites
- Remote development feature is only available in Code Insiders. **Make sure you have installed this version https://code.visualstudio.com/insiders/**.

- Install "Remote Development" extension from VS Code market place https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack


## Overview
DevSpace with `Python v3.6` and `NodeJS v12.3` for using as a remote development environment. So that you can debug and run the application within your DevSpace using VS Code.

SSH is used for connecting to the DevSpace and `openssh server` is configured to use password based authentication with following credentials

- _Username:_ root
- _Password:_ root

## Configuring Remote Development

1. Create your DevSpace by running `devspaces create` command from this directory.
2. Wait for DevSpace creation, then validation completion
3. Run `devspaces start vs-remote` command to start your DevSpace
4. Once your DevSpace is running, run `devspaces info vs-remote` command to find the SSH port(public port which is mapped to port 22) and host name.
  * Navigate to your project repository folder and run `devspaces bind vs-remote` to sync files from your machine to DevSpace
5. Run VS Code code insider build and enable `remote.SSH.showLoginTerminal` setting
6. From VS Code run **Remote-SSH: Open Configuration File..** and add the host to the file using the [SSH config file format](https://linux.die.net/man/5/ssh_config). e.g.
```
Host vs-remote-devspace
    HostName vs-remote.<username>.devspaces.io
    User root
    Port <public SSH port>
```
7. From VS Code open "**Remote SSH**" pane, which should show `vs-remote-devspace` under the connections.
8. Click on the connect button, which will open a new VS Code window and you can open `/data` directory which is in your DevSpace to see the files.


### Demo

![Demo](https://drive.google.com/uc?export=view&id=105X7q0EHwwRGdy9_qa-94kDK-4uJSFJ2)
