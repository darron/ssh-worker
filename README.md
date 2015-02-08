ssh-worker
======

A simple ssh worker for [Iron.io](http://www.iron.io) - can do whatever you need it to do.

Add a `remotessh.yml` file that looks like this:

```
creds:
  username: username-on-the-box
  password: the-password-goes-here
command: uptime
hostname: box.to.ssh.to
```

Grab the `iron.json` file from the Iron.io worker page and place it in here.

Upload the code:

```
iron_worker upload remotessh
```

How you have a webhook that can do whatever that user can do over ssh.
