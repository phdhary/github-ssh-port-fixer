#### What is this and why?

Are you using `ssh` to connect seamlessly with **Github**?

And found yourself this error:

```
ssh: connect to host github.com port 22: No route to host
```

While working on your awesome project?

It also happened to me while using Campus's network.

This little fix works for me by adding below snippet to `~/.ssh/config`.

```
host github.com
  hostname ssh.github.com
  port 443
```

And I make a little **script** to do that.

#### How to use

_Append to ssh config_

- Run this script.
- Choose option 1.
- Accept ssh prompt with `yes`.
- Done.

_Delete ssh config_

When you're on regular network again, simply delete `~/.ssh/config`.

or you can:

- Run this script.
- Choose option 2.
- Done.

_Check github ssh connection_

You can check you ssh connection with github with:

```
ssh -T git@github.com
```

or you also can:

- Run this script.
- Choose option 3.
- Done.
