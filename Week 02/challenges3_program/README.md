The final programming challenge!

The final iteration of the PasswordManager(v2)!

This iteration has the features of the previous
version, but with a bunch of new features. It
can update passwords, delete passwords, find a 
password for a specific service and sort passwords
alphabetically/more recently stored.

One of the requirements was also to refactor our
code, using a *second* class to store the passwords
list, while the primary class handled management.

Not to mention, all passwords needed to be unique
and each service can only store one password each.
This meant also writing extra methods such as
password_unique?() to make the code more readable.
