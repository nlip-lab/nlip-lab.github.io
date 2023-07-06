push:
	git add .
	git commit -m "update"
	git push origin master

build:
	@echo "Building..."
	bundle exec jekyll build

serve:
	@echo "Serving..."
	bundle exec jekyll serve --lsi


resize_carousel_images:
	python3 resize_carousel_images.py

run_counter:
	python3 counter.py

start:
	make run_counter
	make build
	make serve
