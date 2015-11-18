# MySQL Tips

## MySQL preferences

The configuration file can be found at (OS dependent).

```
/etc/my.cnf 
```

or 

```
/etc/mysql/my.cnf 
```

To allow only remote access, bind with accessible external IP address.
This will also need to have ip-tables configured for access grant.

```
bind-address = 192.168.2.20  # My external IP
```

To allow only local access, bind with local address.

```
bind-address = 0.0.0.0
```

To allow both ways, comment out and don't leave `skip-networking` enabled.

```
# bind-address = 192.168.2.20 
```

## To create a new user for local connection

```
CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
```

## To create a new user for remote connection

Guest from anywhere.

```
CREATE USER 'guest'@'%' IDENTIFIED BY 'password';
```

Or guest from a particular IP address.

```
CREATE USER 'guest'@'200.30.1.1' IDENTIFIED BY 'password';
```

## To grant access

```
GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'localhost';
FLUSH PRIVILEGES;
```