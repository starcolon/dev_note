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