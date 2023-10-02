# df

To first run the application in your local environment you can use 

```
make network
make postgres
make createdb
make migrateup
make backend_build_image
make backend_run
``` 

or run those commands, listed in ```Makefile```, ***manually*** with your terminal in the repository root directory.

# Prerequisites

To create a local development environment you need some tools.

## Backend
### Basics

You need the basics if you just want to start a test environment to test the application.

#### Optional but recommended
If you wish to use the `Makefile` you need [`make`](https://www.gnu.org/software/make/) which should be available for most linux systems. 

However if you are on *Windows* you could use [`GnuWin32.Make`](https://gnuwin32.sourceforge.net/install.html) which can be installed on *Windows 11* using:

```
winget install GnuWin32.Make
```

#### Database

To work with the database you need the following tools.

##### Container software

You can use either `docker` or `podman`. But the `Makefile` uses the `docker` command. 

If you wish to use `podman` you can create a `symlink` to make it work.
On `fedora` it works like this:

```
# Rename the docker binary:
sudo mv /usr/bin/docker /usr/bin/docker_bkp

# Create a symlink
sudo ln -s /usr/bin/podman /usr/bin/docker
```

##### golang-migrate

`golang-migrate` makes db schema initialization and updates easy.

You can install it as described [here](https://github.com/golang-migrate/migrate/tree/master/cmd/migrate).

Furthermore the binary should be in your `PATH` environment variable.

The two most used commands are in the `Makefile`:
- migrateup
- migratedown

#### Server

To run the server you need `go` installed. [See here for instructions](https://go.dev/doc/install)

### Developing

Should you want to make changes you need further tools.

- [sqlc](https://docs.sqlc.dev/en/stable/overview/install.html): For generating code from `postgres` queries
- [gomock](https://github.com/uber-go/mock): For generating a mock database for testing

## Frontend

***This section will be added as soon as we begin with the development of the frontend***