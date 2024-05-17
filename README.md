# assmer[ctl/d]

## Usage

Example config

```ini
[profile test-mfa]
region = xxx
source_profile = xxx
role_session_name = xxx
role_arn = xxx
mfa_serial = xxxx
```

And whenever you call `assumerctl`, it will list all roles with this setup.

```
** Profiles **
0) test-mfa
Select profile: 0
Selected Profile: test-mfa
```

<br/>

And when you select your profile, you get a new temporary role added to your aws config.

<br/>

And it will get auto deleted from your aws config when the expiry time is reached.

```
Profile created !
The profile name is: tkucr
The profile will expire at: 2024-05-16T17:50:00+00:00

assumerd will automatically remove the profile after expiration
```


The auto deletion part only works on MacOS currently, it's based on Mac's init system (launchd).

<br/>

The same can be done on Linux with systemd.

## Installation

```bash
# clone the repository
git clone https://github.com/fuadop/aws-assume-role-manager.git

# change directory into the clone
cd aws-assume-role-manager

# run the install script
./install.sh
```
