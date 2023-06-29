push:
	git add .
	git commit -m "update"
	git push origin dev

build:
	@echo "Building..."
	bundle exec jekyll build

serve:
	@echo "Serving..."
	bundle exec jekyll serve --lsi


resize_carousel_images:
	python3 resize_carousel_images.py

start:
	make resize_carousel_images
	make build
	make serve
