SOURCES = $(wildcard *.md)
OUTDIR  = md
HTMLS   = $(patsubst %.md,$(OUTDIR)/%.html,$(SOURCES))
ASSETS  = $(wildcard *.png) $(wildcard *.jpg) assets
SERVER  = username@example.com:~/public_html/

all: html sync

html: $(HTMLS)

$(HTMLS) : $(OUTDIR)/%.html: %.md
	pandoc --standalone --from="markdown" --to="html" --template="assets/default.html5" --include-in-header="assets/inc-head.html" --include-before-body="assets/inc-body.html" --metadata pagetitle="$(shell grep -E -m1 "^#[^#]" $^ | cut -c3-)" -o $@ $<

.PHONY: all html sync
sync: Makefile $(SOURCES) $(ASSETS) $(OUTDIR)
	rsync -r $^ $(SERVER)

