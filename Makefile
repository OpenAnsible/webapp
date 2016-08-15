ELM   = elm-make
SLIMIT= slimit

ELM_SRC  =src
STATIC_JS=assets/js

default: elm

elm: $(STATIC_JS) $(STATIC_JS)/elm.js
min: $(STATIC_JS) $(STATIC_JS)/elm.min.js
gzip: $(STATIC_JS) $(STATIC_JS)/elm.min.js.gz

$(STATIC_JS): $(STATIC_JS)
	mkdir assets; cd assets; mkdir js;

$(STATIC_JS)/elm.min.js.gz: $(STATIC_JS)/elm.min.js
	gzip -f -k -9 $(STATIC_JS)/elm.min.js

$(STATIC_JS)/elm.min.js: $(STATIC_JS)/elm.js
	$(SLIMIT) $(STATIC_JS)/elm.js > $(STATIC_JS)/elm.min.js

$(STATIC_JS)/elm.js: $(ELM_SRC)/Main.elm
	$(ELM) $(ELM_SRC)/Main.elm --output=$(STATIC_JS)/elm.js

.PHONY: clean

clean:
	rm $(ELM_SRC)/elm.js
	rm $(ELM_SRC)/elm.min.js
	rm $(ELM_SRC)/elm.min.js.gz