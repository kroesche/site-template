# Makefile Help

This project assumes you have GNU Make.

## Customizing

### Deployment SSH

The following variables are at the top of the file. You need to edit them if
you want to use `make deploy` to copy the files to your web server using
rsync.

    # SSH for rsync deploy
    SSH_PORT=18301
    SSH_USER=webhost-username
    SSH_HOST=webhost-domain.tld
    SSH_PATH=webhost-internal-path/$(SITE_PATH)

All these values are going to depend on your web host and how they are set up
for ssh and internal file paths to your web site.

* `SSH_PORT` - the port number used for SSH to your web host/server
* `SSH_USER` - your account user name on your web host/server
* `SSH_HOST` - the domain name of your web server used for logins
* `SSH_PATH` - the file to where your static site files should be stored

### SSH Keys

The `make deploy` rsync method uses SSH passwordless login using ssh keys. You
must have created an SSH key for your development computer, and provided the
public key to your web host/server. Here are some articles about how to set
that up.

* <https://www.digitalocean.com/community/tutorials/how-to-configure-ssh-key-based-authentication-on-a-linux-server>
* <https://www.redhat.com/en/blog/key-based-authentication-ssh>
* <https://docs.oracle.com/en/cloud/cloud-at-customer/occ-get-started/generate-ssh-key-pair.html>
* <https://medium.com/@jakewies/accessing-remote-machines-using-ssh-55a0fdf5e9d8>

### Link Checking

If you to use `make linkchecker` to validate the links on your web site, then
you need edit the following variables:

    # web facing path
    SITE_URL=https://site-domain.tld
    SITE_PATH=site-path

    # linkchecker site credentials, uncomment if needed
    #LINKCHECKER_CREDS=--user site-username --password

The `SITE_URL` and `SITE_PATH` variables should be set to the public URL of
your web site. Assuming your web site URL is `example.com/mysite` then these
should be set as:

* `SITE_URL=https://example.com`
* `SITE_PATH=mysite`

If your site is public and is not protected by a password, then you can leave
`LINKCHECKER_CREDS` commented out. If you do have a user name and password
for your site, then uncomment `LINKCHECKER_CREDS` and edit it to be your site
user name. You do not enter the password here, you will be asked for it when
you use `make deploy`.

## Usage

You can see all the make targets by typing `make help`:

```
-------------
Makefile help
-------------

build       - generate site files
serve       - development server
clean       - clean generated files
deploy      - rsync to web site
linkchecker - check links on deployed site
spell       - run spell checker
nonascii    - find files with non-ascii characters
minify      - run minifier on css, js, and html site files

venv        - create python virtual environment (automatic when needed)
cleanvenv   - clean the python venv
audit       - run python package checker (automatic when needed)
requirements- generate updated requirements file
```

### build

    make build

Builds the web site and puts the resulting static site contents into a
subdirectory named "site".

### serve

    make serve

Starts a local web server so you can view and test your site. This is just
running on your local machine. You can view the site by using the following
URL in your browser: `http://localhost:8000`

### clean

    make clean

Removes the files that were created by "build". None of the document source
files are deleted.

### deploy

    make deploy

Uses "rsync" to copy your static web site files (in "site") to the server you
set up in the Makefile. This uses SSH so you should be familiar with how `ssh`
works. See the [section about setting up deployment](#deployment-ssh) above.

### linkchecker

    make linkchecker

This is an optional step. It will scan your deployed web site for broken links.

### spell

    make spell

This is an optional step. If you use this command, you will see a list for each
file of any words that are not known to the aspell dictionary. Besides genuine
typos and misspellings, jargon and proper names often turn up in this list.
You can either just scan the list of unknown words and make sure everything is
okay, OR ... If you like a clean check you can add any words that are listed
into the file "wordlist.txt". When you do this you are telling aspell that
word is okay, and it will no longer appear when you run the check.

When I use this, I scan the list for any real errors and fix those. Then I add
any remaining words (which are often jargon, or coding words, or people or
place names) to "wordlist.txt". I like to do this until there are no reported
unknown words when I run `make spell`.

The example `wordlist.txt` contains unrecognized words from this documentation,
so that this project itself will pass the spell check.

### nonascii

    make nonascii

This is an optional step. This will scan your document source for any
characters that are not ASCII. This can happen if someone sends you document
source that was edited in Word or similar. It will often be characters like
"smart quote" or en-dash or em-dash. There is nothing wrong with leaving these
in your source if that is your preference. My personal preference is that I
like my source to be pure text, which to me means ascii-only. I run this check
and replace any non-ascii characters in my md documents with their ascii
equivalents.

### minify

    make minify

This is an optional step. Once you have built your site `make build`, this
optional step will run a minifier on the css files in your "site"  and remove
unused elements and compress the css files to make them smaller. It is not
necessary to do this, your site will work fine. However it will make the css
for your site smaller which means they might load faster. It also may affect
google's opinion of your site if you care about such things.

This only minifies css. I tested minifying the js, but the theme already uses
minified versions and there was nothing to be gained. There may be potential
gains by minifying the html but I have not explored that yet.

### venv

    make venv

This make target will be run automatically when needed so you probably don't
need to run it unless you want to deliberately create your venv before doing
any other tasks.

### cleanvenv

    make cleanvenv

Removes the virtual environment `venv`. This can be used if you want to clean
your venv and rebuild it, or when are done with your project just to clear off
the no-longer needed files.

### audit

    make audit

This will run automatically the first time the venv is created. It scans the
python packages for known security vulnerabilities. You can optionally run it
on your although that is not really necessary unless you add additional
packages.

### requirements

    make requirements

Creates the requirements file that is used to build the venv. You would use
this if you added new packages to `requirements.in`, in order for the new
packages to get picked up when you create a new or updated venv. The other
situation when this might be used is to force all the packages to update to the
latest available versions.
