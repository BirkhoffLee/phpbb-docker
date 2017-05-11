# phpBB-docker [![](https://images.microbadger.com/badges/image/birkhofflee/phpbb-docker.svg)](https://microbadger.com/images/birkhofflee/phpbb-docker)
A Docker image for running a phpBB site, very light-weight and well-optimized.

# Deployment
You have to manually install Docker first if you don't have it installed on your server. Check out the official install guide here: https://docs.docker.com/engine/installation.

## Using docker-compose (automated)
For this method of deploying, you will need to install `docker-compose` for quick deploying, if you don't have it:
```
$ curl -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ chmod +x /usr/local/bin/docker-compose
```

> Note: If you get a “Permission denied” error while running the commands above, please add `sudo` at the start of them and run again. This will require sudo access.

When you're done, clone this repository and run! (`-d` means detach mode, e.g. run in background)
```
$ git clone https://github.com/BirkhoffLee/phpbb-php-docker
$ cd phpBB-php-docker
$ docker-compose up -d
```

By default, phpBB-php will then running on `0.0.0.0:80`! Open `http://<your-server-ip-address>` on your browser. Instead, if you're trying on your personal computer, open `http://localhost` then.

## Manually run commands
If you more like to run the container by yourself or using it with other containers like [jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy), you may want to do it yourself.

First, clone this repository:

```
$ git clone https://github.com/MineMystery/phpBB-php-docker
$ cd phpBB-php-docker
```

Next, build the image.

```
$ docker build -t phpBB .
```

Next, run the image we just built and a MySQL container as well.

```
$ docker run -d -e "MYSQL_ROOT_PASSWORD=phpbb" -e "MYSQL_USER=phpbb" -e "MYSQL_PASSWORD=phpbb" -e "MYSQL_DATABASE=phpbb" --name phpbb_db mysql
$ docker run -d -p 80:80 --link phpbb_db --name phpbb phpbb
```

That's it!

# phpBB Installation
After deploying the containers, open the corresponding url in your web browser to get started with phpBB.

Follow the install wizard. When the database configuration page shows up, fill `phpbb_db` into the database address field.

For the rest information, please fill the following details into the corresponding fields on the page, if you used the default database configuration during deployment:

> Database Username: `phpbb`
  Database Password: `phpbb`
  Database Name: `phpbb`

Follow the rest of the installation, and you should be done.
