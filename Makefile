prefix = /usr/local
exec_prefix = $(prefix)
sbindir     = $(exec_prefix)/sbin
datarootdir = $(prefix)/share
mandir      = $(datarootdir)/man

INSTALL         = install
INSTALL_PROGRAM = $(INSTALL) --mode a+rx,u+w
INSTALL_DIR     = $(INSTALL) -d
INSTALL_DATA    = $(INSTALL) --mode a+r,u+w

HELP2MAN = help2man

MANSECT=8

all: iodine-client-start.$(MANSECT)

iodine-client-start.$(MANSECT): iodine-client-start
	$(HELP2MAN) --output=iodine-client-start.$(MANSECT) --no-info --section=$(MANSECT) \
	 --name="start an iodine IPv4-over-DNS tunnel" ./iodine-client-start

install: iodine-client-start.$(MANSECT)
	$(INSTALL_DIR)				$(DESTDIR)$(sbindir)
	$(INSTALL_PROGRAM) iodine-client-start	$(DESTDIR)$(sbindir)/
	$(INSTALL_DIR)				$(DESTDIR)$(mandir)/man$(MANSECT)
	$(INSTALL_DATA) iodine-client-start.$(MANSECT)	$(DESTDIR)$(mandir)/man$(MANSECT)/

clean:
	-rm -f iodine-client-start.$(MANSECT)

.PHONY: all install clean
