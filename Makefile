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

all: iodine-client-start.8

iodine-client-start.8: iodine-client-start
	$(HELP2MAN) --output=iodine-client-start.8 --no-info --section=8 \
	 --name="start an iodine IPv4-over-DNS tunnel" ./iodine-client-start

install: iodine-client-start.8
	$(INSTALL_DIR)                         $(DESTDIR)$(sbindir)
	$(INSTALL_PROGRAM) iodine-client-start $(DESTDIR)$(sbindir)/
	$(INSTALL_DIR)                         $(DESTDIR)$(mandir)/man1
	$(INSTALL_DATA) iodine-client-start.8  $(DESTDIR)$(mandir)/man1/

clean:
	-rm -f iodine-client-start.8

.PHONY: all install clean
