.PHONY: clean hackcss css

DOWN = downloads

$(DOWN):
	mkdir -p $@

clean:
	rm -rf $(DOWN)

%.css: $(DOWN)
	curl -o $(DOWN)/$@ https://cdn.jsdelivr.net/npm/hack@0.8.0/dist/$(@F)

STYLE=dark

layouts/partials/head/vendor.css: hack.css $(STYLE).css
	cat downloads/*.css > $@

css: layouts/partials/head/vendor.css
